//
//  Restaurant.swift
//  WhatToEatToday
//
//  Created by Nhung Tran on 25/07/2022.
//

import Foundation
import CoreLocation

struct Restaurant : Decodable, Identifiable {
    var id: Int = 0
    var name: String = "Yeebo"
    var description: String = "Our extensive menu of over 300 dishes is the quintessence of traditional Chinese cuisine. The menu offers a wide range of dishes from nutritious Hotpot to Dimsum, and signature roasted dishes such as Pecking duck, roasted goose, top-of-the-range abalone, and cheese baked lobster just to name a few."
    var tel : String = "028 5412 1313"
    var openHour: String = "7AM – 2PM & 5PM – 10PM"
    var categories: [String] = ["Dim Sum", "Hot Pot"]
    var coordinates: [Double] = [0.0, 0.0]
    var address: String = "109 Tôn Dật Tiên"

    var rating: Double = 4
    var hasGone: Bool = false
    var isInCustomList: Bool = false
    
    var foodList = [Food]()
//    static func testData ()-> Food {
//        return Food(id: <#T##Int#>, name: <#T##String#>, description: <#T##String#>, category: <#T##String#>, price: <#T##Int#>)
//    }
    func coordinateObject() -> CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: coordinates[0], longitude: coordinates[1])
    }
    func isPopular() -> Bool {
        return rating > 3.5
    }
    func findPriceRange() -> String {
        let minPrice = foodList.map{$0.price}.min()
        let maxPrice = foodList.map{$0.price}.max()
        if let newMin = minPrice, let newMax = maxPrice {
            return "\(String(newMin / 1000))k ~ \(String(newMax / 1000))k VND"
        }
        return "0d ~ 0d"
    }

}
struct Food : Decodable, Identifiable {
    var id: Int = 0
    var name : String = "Shrimp Dumplings"
    var description: String = ""
    var category: String = "Dim Sum"
    var price: Int = 84_000
}





