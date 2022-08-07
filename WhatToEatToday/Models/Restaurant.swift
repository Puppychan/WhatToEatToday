//
//  Restaurant.swift
//  WhatToEatToday
//
//  Created by Nhung Tran on 25/07/2022.
//

import Foundation
import CoreLocation

struct Restaurant: Decodable, Identifiable {
    var id: Int = 0
    var name: String = ""
    var description: String = ""
    var tel: String = ""
    var openHour: String = ""
    var categories: [String] = [""]
    var coordinates: [Double] = [0.0, 0.0]
    var address: String = ""

    var rating: Double = 4

    var foodList = [Food]()
    func coordinateObject() -> CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: coordinates[0], longitude: coordinates[1])
    }
    func isPopular() -> Bool {
        return rating >= 4.5
    }
    func findPriceRange() -> String {
        let minPrice = foodList.map { $0.price }.min()
        let maxPrice = foodList.map { $0.price }.max()
        if let newMin = minPrice, let newMax = maxPrice {
            return "\(String(newMin / 1000))k ~ \(String(newMax / 1000))k VND"
        }
        return "0d ~ 0d"
    }

    static func testData () -> Restaurant {
        return Restaurant(
            id: 0,
            name: "Yeebo",
            description: "Our extensive menu of over 300 dishes is the quintessence of traditional Chinese cuisine. The menu offers a wide range of dishes from nutritious Hotpot to Dimsum, and signature roasted dishes such as Pecking duck, roasted goose, top-of-the-range abalone, and cheese baked lobster just to name a few.",
            tel: "028 5412 1313",
            openHour: "7AM – 2PM & 5PM – 10PM",
            categories: ["Dim Sum", "Hot Pot"],
            coordinates: [0.0, 0.0],
            address: "109 Tôn Dật Tiên",
            rating: 4,
            foodList: [Food.testData()])
    }
}
struct Food: Decodable, Identifiable {
    var id: Int = 0
    var name: String = ""
    var description: String = ""
    var category: String = ""
    var price: Int = 0
    static func testData() -> Food {
        return Food(id: 0, name: "Shrimp Dumplings - Har Gow", description: "Shrimp, Flour", category: "Dim Sum", price: 30_000)
    }
}





