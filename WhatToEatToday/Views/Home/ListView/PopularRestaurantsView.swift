//
//  PopularRestaurantsView.swift
//  WhatToEatToday
//
//  Created by Nhung Tran on 29/07/2022.
//

import SwiftUI

struct PopularRestaurantsView: View {
    @EnvironmentObject var model: RestaurantModel
    var body: some View {
        VStack(alignment: .leading) {
            Text("Popular")
                .font(.title2)
                .bold()
                .padding()
            
            // MARK:
            if (model.hasPopularRestaurant()) {
                ScrollView(.horizontal) {
                    HStack(spacing: 10) {
                        ForEach(model.restaurants.indices, id: \.self) { index in
                            if (model.restaurants[index].isPopular()) {
                                RestaurantLinkView(
                                    destinationView: AnyView(RestaurantDetailView(rest: model.restaurants[index])),
                                   labelView: AnyView(RestaurantCardView(rest: model.restaurants[index], cardWidth: 250, cardHeight: 180, displayType: "popular")),
                                    navigateMethod: {model.navigateRestaurant(model.restaurants[index].id)})
                                .padding()
                                if (index != model.restaurants.count - 1) {
                                    Divider()
                                }
                            }
                        }
                    }
                }
            }
            else {
                Text("No Popular Restaurant Now")
            }
        }
    }
}
