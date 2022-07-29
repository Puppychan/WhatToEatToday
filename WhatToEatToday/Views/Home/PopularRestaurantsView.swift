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
            
            // MARK:
            if (model.hasPopularRestaurant()) {
                ScrollView(.horizontal) {
                    HStack(spacing: 10) {
                        ForEach(model.restaurants.indices, id: \.self) { index in
                            if (model.restaurants[index].isPopular()) {
                                NavigationLink(
                                    destination: {
                                        RestaurantDetailView(rest: model.restaurants[index])
                                            .onAppear() {
                                                model.navigateRestaurant(model.restaurants[index].id)
                                            }
                                    },
                                    label: {
                                        RestaurantCardView(rest: model.restaurants[index], cardWidth: 250, cardHeight: 180, displayType: "popular")
                                    })
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
        .padding()
    }
}

struct PopularRestaurantsView_Previews: PreviewProvider {
    static var previews: some View {
        PopularRestaurantsView()
    }
}
