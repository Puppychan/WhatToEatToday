//
//  RestaurantModel.swift
//  WhatToEatToday
//
//  Created by Nhung Tran on 26/07/2022.
//

//ref:
//https://stackoverflow.com/questions/24534229/swift-modifying-arrays-inside-dictionaries
//https://stackoverflow.com/questions/37517829/get-distinct-elements-in-an-array-by-object-property
// https://stackoverflow.com/questions/21983559/opens-apple-maps-app-from-ios-app-with-directions

import Foundation
import CoreLocation
import MapKit

class RestaurantModel : NSObject, CLLocationManagerDelegate, ObservableObject {
    @Published var restaurants = [Restaurant]()
    
    // Location
    var locationManager = CLLocationManager()
    @Published var authorizationState = CLAuthorizationStatus.notDetermined
//    @Published var currentRegion = MKCoordinateRegion()
    // Current user region and coordinate
    @Published var userLocation = MKCoordinateRegion()
    @Published var currentUserCoordinate: CLLocationCoordinate2D?
    
    // Current Food
    @Published var currentFood: Food?
    var currentFoodIndex = 0
    
    
    // Current restaurant
    @Published var currentRestaurant: Restaurant?
    var currentRestaurantIndex = 0
    
    override init() {
        // Init method of NSObject
        super.init()
        getLocalData()
        
        // Set content model as the delegate of the location manager
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
    }
    
    // MARK: - Location Manager Delegate Methods
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {

        // Update the authorizationState property
        authorizationState = locationManager.authorizationStatus

        if locationManager.authorizationStatus == .authorizedAlways ||
            locationManager.authorizationStatus == .authorizedWhenInUse {
            // after getting permission
            locationManager.startUpdatingLocation()
        }
        else if locationManager.authorizationStatus == .denied {
            print("No Permission")
        }
    }

    // MARK: Location manager

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // stop auto zooming in apple map
        manager.stopUpdatingLocation()
        // store userLocation
        locations.last.map {
            currentUserCoordinate = CLLocationCoordinate2D(latitude: $0.coordinate.latitude, longitude: $0.coordinate.longitude)
            userLocation = createCoordinateRegion(currentUserCoordinate!)
            
            // display recent restaurants inside the regions
//            currentRegion = userLocation
        }

    }
    // MARK: Ask user location permission
    func requestGeolocationPermission() {
        // remember to open Info -> Target -> Info -> Below Bundle Version String -> Click add -> Type "Privacy - Location When In Use Usage Description" with value "Please allow us to access your location"
        // Request permission from the user
        locationManager.requestWhenInUseAuthorization()
    }
    func createCoordinateRegion(_ coordinate: CLLocationCoordinate2D) -> MKCoordinateRegion {
        return MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
        )
    }
    
    
    private func convertCoordinateString(_ coordinate: CLLocationCoordinate2D) -> String {
        return "\(String(format: "%f", coordinate.latitude)),\(String(format: "%f", coordinate.longitude))"
//        return "\(coordinate.latitude.description),\(coordinate.latitude.description)"
    }
    func openAppleMap(endCoordinate: CLLocationCoordinate2D) {
        let directionsURL = "http://maps.apple.com/?saddr=\(convertCoordinateString(currentUserCoordinate ?? CLLocationCoordinate2D()))&daddr=\(convertCoordinateString(endCoordinate))"
        guard let url = URL(string: directionsURL) else {
            return
        }
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
    
    // MARK: - Deal with Data
    func getLocalData() {
        // get url to json file
        let jsonUrl = Bundle.main.url(forResource: "restaurants", withExtension: "json")
        
        // read file into data object
        do {
            let jsonData = try Data(contentsOf: jsonUrl!)
            
            // try to decode  json -> array modules
            let jsonDecoder = JSONDecoder()
            let restaurants = try jsonDecoder.decode([Restaurant].self, from: jsonData)
            // assign parsed module to module property
            self.restaurants.append(contentsOf: restaurants)
        }
        catch {
            // catch error
            print("Could not parse local data")
        }
    }
    
    // MARK: - Restaurant
    // MARK: Restaurant Navigation Method
    func navigateRestaurant(_ restId: Int) {
        // find the index for the restaurant id
        currentRestaurantIndex = restaurants.firstIndex(where: {
            $0.id == restId
        }) ?? 0
        
        // set the current restaurant
        currentRestaurant = restaurants[currentRestaurantIndex]
    }
    
    // check if has popular restaurant
    func hasPopularRestaurant() -> Bool {
        for rest in restaurants {
            if (rest.isPopular()) {
                return true
            }
        }
        return false
    }
    
    // MARK: - Food
    // create category list
    func findAllCategories(_ restId: Int) -> [String] {
        let restaurantIndex = restaurants.firstIndex(where: { $0.id == restId}) ?? 0
        var categorySet = Set<String>() // unique list to keep track of unique string
        var categoryArr = [String]()
        for food in restaurants[restaurantIndex].foodList {
            if !categorySet.contains(food.category) {
                categorySet.insert(food.category)
                categoryArr.append(food.category)
            }
        }
        return categoryArr
        
    }
    
    // MARK: Food Navigation Method
    func navigateFood(_ foodId: Int, _ restId: Int) {
        let restaurantIndex = restaurants.firstIndex(where: { $0.id == restId}) ?? 0
        // find the index for the restaurant id
        currentFoodIndex = restaurants[restaurantIndex].foodList.firstIndex(where: {
            $0.id == foodId
        }) ?? 0
        
        // set the current restaurant
        currentFood = restaurants[restaurantIndex].foodList[currentFoodIndex]
    }
    
}




extension Array {
    func unique<T:Hashable>(by: ((Element) -> (T)))  -> [Element] {
        //the unique list kept in a Set for fast retrieval
        var set = Set<T>()
        //keeping the unique list of elements but ordered
        var arrayOrdered = [Element]()
        for value in self {
            if !set.contains(by(value)) {
                set.insert(by(value))
                arrayOrdered.append(value)
            }
        }

        return arrayOrdered
    }
}
