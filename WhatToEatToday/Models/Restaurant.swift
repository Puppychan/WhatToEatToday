//
//  Restaurant.swift
//  WhatToEatToday
//
//  Created by Nhung Tran on 25/07/2022.
//

import Foundation

struct Restaurant : Decodable, Identifiable {
    var id: Int = 0
    var name: String = "Yeebo"
    var description: String = "Our extensive menu of over 300 dishes is the quintessence of traditional Chinese cuisine. The menu offers a wide range of dishes from nutritious Hotpot to Dimsum, and signature roasted dishes such as Pecking duck, roasted goose, top-of-the-range abalone, and cheese baked lobster just to name a few."
    var tel : String = "028 5412 1313"
    var address: String = "109 Tôn Dật Tiên"
    var openHour: String = "7AM – 2PM & 5PM – 10PM"
    var categories: [String] = ["Dim Sum", "Hot Pot"]

    var isFavorite: Bool = false
    var hasGone: Bool = false
    var isInCustomList: Bool = false
    
//    var priceRange: Double = 0.0
    
    var foodList = [Food]()
    
    // ignore when convert json to object
//    @NotCoded var priceRange: Double

}
struct Food : Decodable, Identifiable {
    var id: Int = 0
    var name : String = "Shrimp Dumplings"
    var description: String = ""
    var category: String = "Dim Sum"
    var price: Int = 84_000
    var image: String = ""
}

struct Fd : Identifiable {
    var id: Int = 0
    var name : String = "Shrimp Dumplings"
    var description: String = "Our extensive menu of over 300 dishes is the quintessence of traditional Chinese cuisine. The menu offers a wide range of dishes from nutritious Hotpot to Dimsum, and signature roasted dishes such as Pecking duck, roasted goose, top-of-the-range abalone, and cheese baked lobster just to name a few."
    var category: String = "Dim Sum"
    var price: Int = 84_000
    var image: String = "Yeebo-Shrimp Dumplings"
}






