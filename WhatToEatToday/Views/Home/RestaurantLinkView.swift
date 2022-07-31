//
//  RestaurantLinkView.swift
//  WhatToEatToday
//
//  Created by Nhung Tran on 31/07/2022.
//

import SwiftUI

struct RestaurantLinkView: View {
    var destinationView: AnyView
    var labelView: AnyView
    var navigateMethod: () -> Void
    var body: some View {
//        NavigationLink(destination: {
//            RestaurantDetailView(rest: item)
//                .onAppear() {
//                model.navigateRestaurant(item.id)
//            }
//        }, label: {
//                // MARK: restaurant basic card
//                if (searchQuery.isEmpty) {
//                    RestaurantCardView(rest: item, cardWidth: 340, cardHeight: 357, displayType: "all")
//                }
//                else {
//                    RestaurantSearchCardView(rest: item)
//                        .frame(width: 340)
//                }
//            })
        NavigationLink(destination: {
            destinationView
                .onAppear() {
                navigateMethod()
            }
        }, label: {
                // MARK: restaurant basic card
                labelView
            })
    }
}
