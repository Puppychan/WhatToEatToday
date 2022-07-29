//
//  RestaurantModel.swift
//  WhatToEatToday
//
//  Created by Nhung Tran on 26/07/2022.
//

//ref:
//https://stackoverflow.com/questions/24534229/swift-modifying-arrays-inside-dictionaries
//https://stackoverflow.com/questions/37517829/get-distinct-elements-in-an-array-by-object-property

import Foundation
import CoreLocation

class RestaurantModel : NSObject, CLLocationManagerDelegate, ObservableObject {
    @Published var restaurants = [Restaurant]()
    
    var locationManager = CLLocationManager()
    @Published var authorizationState = CLAuthorizationStatus.notDetermined
    @Published var userLocation: CLLocation?
    
    
    // Current restaurant
    @Published var currentRestaurant: Restaurant?
    var currentRestaurantIndex = 0
    
    override init() {
//        for index in 0...9 {
//            restaurants.append(Restaurant())
//            restaurants[index].foodList.append(Food())
//        }
        
        // Init method of NSObject
        super.init()
        getLocalData()
        
        // Set content model as the delegate of the location manager
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
    }
    
    // MARK: - Deal with location
    func requestGeolocationPermission() {
        // remember to open Info -> Target -> Info -> Below Bundle Version String -> Click add -> Type "Privacy - Location When In Use Usage Description" with value "Please allow us to access your location"
        // Request permission from the user
        locationManager.requestWhenInUseAuthorization()
    }
    
    // MARK: - Location Manager Delegate Methods
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
        // Update the authorizationState property
        authorizationState = locationManager.authorizationStatus
        
        if locationManager.authorizationStatus == .authorizedAlways ||
            locationManager.authorizationStatus == .authorizedWhenInUse {
            // We have permission
            // Start geolocating the user, after we get permission
            locationManager.startUpdatingLocation()
        }
        else if locationManager.authorizationStatus == .denied {
            print("You dont have permission to access")
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
    
    // filter food with category
    func filterCategory(forId: Int, category: String) -> [Food] {
        let restaurantIndex = restaurants.firstIndex(where: { $0.id == forId}) ?? 0
        return restaurants[restaurantIndex].foodList.filter { fd in
            fd.category == category
        }
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
