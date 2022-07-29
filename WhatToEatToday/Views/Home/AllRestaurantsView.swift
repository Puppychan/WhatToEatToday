//
//  AllRestaurantsView.swift
//  WhatToEatToday
//
//  Created by Nhung Tran on 29/07/2022.
//

import SwiftUI

struct AllRestaurantsView: View {
    @EnvironmentObject var model: RestaurantModel
    var body: some View {
        VStack(alignment: .leading) {
            Text("All Restaurants")
                .font(.largeTitle)
                .bold()
            VStack(spacing: 40) {
                // MARK: display 1 restaurant
                ForEach(model.restaurants) { item in
                    NavigationLink(destination: {
                        RestaurantDetailView(rest: item)
                            .onAppear() {
                            model.navigateRestaurant(item.id)
                        }
                    }, label: {
                            // MARK: restaurant basic card
                            RestaurantCardView(rest: item, cardWidth: 340, cardHeight: 357, displayType: "all")
                        })

                }
            }
        }
    }
}
