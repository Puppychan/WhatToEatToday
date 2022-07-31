//
//  HomeView.swift
//  WhatToEatToday
//
//  Created by Nhung Tran on 19/07/2022.
//

import SwiftUI

struct HomeView: View {
    func logoImage(rest: Restaurant) {
//        model.restaurants[index]
        ZStack {
            // logo image
            Circle()
                .frame(width: 40, height: 40)
                .foregroundColor(.white)
                .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 10, x: -5, y: 5)
            Image("\(rest.name)-logo")
                .clipped()

        }
    }

    @EnvironmentObject var model: RestaurantModel
    @State var searchQuery = ""


    var body: some View {

        NavigationView {

            ScrollView {
                VStack {
                    // MARK: - filter category list
                    ScrollView(.horizontal) {
                        HStack(spacing: 40) {
                            ForEach(SideAppModels.restaurantCategories, id: \.self) { cate in
                                CategoryItemView(name: cate)

                            }
                            .frame(height: 90)
                            
                        }
                        .padding()
                    }
                    .background(Color("CategoryFilterBckColor"))
                    
                    // MARK: - national pick
                    
                    // MARK: - Display popular restaurants
                    if searchQuery.isEmpty {
                        PopularRestaurantsView()
                        Divider()
                    }

                    // MARK: - Display restaurant when searching and display all restaurants
                    VStack(alignment: .leading) {
                        Text("All Restaurants")
                            .font(.largeTitle)
                            .bold()
                            .padding(.top, searchQuery.isEmpty ? 0 : 10)
                        VStack(spacing: searchQuery.isEmpty ? 45 : 30) {
                            // MARK: display 1 restaurant
                            ForEach(filteredSearchRestaurant) { item in
                                RestaurantLinkView(
                                    destinationView: AnyView(RestaurantDetailView(rest: item)),
                                    labelView: AnyView(RestaurantCardView(rest: item, cardWidth: 340, cardHeight: 357, displayType: "all")),
                                    navigateMethod: {model.navigateRestaurant(item.id)})

                            }
                        }
                        // placement helps always display search bar when scroll
                        .searchable(text: $searchQuery, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search Restaurants By Name") {
                            ForEach(filteredSearchRestaurant) { rest in
                                Text("Are you looking for \(rest.name)").searchCompletion(rest.name)
                            }
                        }
                    }

                }
                    .frame(
                    minWidth: 0,
                    maxWidth: .infinity,
                    minHeight: 0,
                    maxHeight: .infinity,
                    alignment: .center
                )
            }
        }

    }
    var filteredSearchRestaurant: [Restaurant] {
        // search function
        if searchQuery.isEmpty {
            return model.restaurants
        }
        else {
            // if user types text to search
            return model.restaurants.filter {
                $0.name.lowercased().contains(searchQuery.lowercased())
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(RestaurantModel())
    }
}
