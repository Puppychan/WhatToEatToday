//
//  RestaurantModel.swift
//  WhatToEatToday
//
//  Created by Nhung Tran on 26/07/2022.
//

//ref: https://stackoverflow.com/questions/24534229/swift-modifying-arrays-inside-dictionaries

import Foundation

class RestaurantModel : ObservableObject {
    @Published var restaurants = [Restaurant]()
    
    // Current restaurant
    @Published var currentRestaurant: Restaurant?
    var currentRestaurantIndex = 0
    
    init() {
//        for index in 0...9 {
//            restaurants.append(Restaurant())
//            restaurants[index].foodList.append(Food())
//        }
        getLocalData()
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
    
    // MARK: - Food
    // create category list
    
    // filter food with category
    func filterCategory(forId: Int, category: String) -> [Food] {
        let restaurantIndex = restaurants.firstIndex(where: { $0.id == forId}) ?? 0
        return restaurants[restaurantIndex].foodList.filter { fd in
            fd.category == category
        }
    }
}