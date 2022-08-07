//
//  HomeView.swift
//  WhatToEatToday
//
//  Created by Nhung Tran on 19/07/2022.
//

import SwiftUI

struct HomeView: View {
    @State var isShowingMap = false

    @EnvironmentObject var model: RestaurantModel
    @State var searchQuery = ""


    var body: some View {

        NavigationView {

            ZStack {
                ScrollView {
    //                RestaurantsMapView()
                    VStack {
                        if searchQuery.isEmpty {
                            // List of
                            // MARK: - national pick

                            // MARK: - filter category list
//                            ScrollView(.horizontal) {
//                                HStack(spacing: 40) {
//                                    ForEach(SideAppModels.restaurantCategories, id: \.self) { cate in
//                                        CategoryItemView(name: cate)
//
//                                    }
//                                        .frame(height: 90)
//
//                                }
//                                    .padding()
//                            }
//                                .background(Color("CategoryFilterBckColor"))

                            // MARK: - Display popular restaurants
                            PopularRestaurantsView()
                        }

                        // MARK: - Display restaurant when searching and display all restaurants
                        VStack(alignment: .leading) {
                            // if search found or user searches nothing
                            if filteredSearchRestaurant.count != 0 {
                                Text("All Restaurants")
                                    .font(.largeTitle)
                                    .bold()
                                    .padding(.top, searchQuery.isEmpty ? 0 : 10)
                                VStack(spacing: searchQuery.isEmpty ? 45 : 30) {
                                    // MARK: display 1 restaurant
                                    ForEach(filteredSearchRestaurant) { item in
                                        // if user does not use search feature
                                        if searchQuery.isEmpty {
                                            NavigateLink(
                                                destinationView: AnyView(RestaurantDetailView(rest: item)),
                                                labelView: AnyView(RestaurantCardView(rest: item, cardWidth: UIScreen.main.bounds.width - 30, cardHeight: 357, displayType: "all")),
                                                navigateMethod: { model.navigateRestaurant(item.id) })
                                        } else {
                                            // if user uses search feature and search found
                                            NavigateLink(
                                                destinationView: AnyView(RestaurantDetailView(rest: item)),
                                                // display label view if the user is searching or not
                                                labelView: AnyView(RestaurantSearchCardView(rest: item)
                                                        .frame(width: UIScreen.main.bounds.width - 30)),
                                                navigateMethod: { model.navigateRestaurant(item.id) })
                                        }
                                    }
                                }
                            } else {
                                // if search not found
                                Spacer()
                                NotFoundView(message: "Not Found _\(searchQuery)_ Restaurant")
                                    .padding()
                                Spacer()
                            }
                        }

                    }
                    // add frame
                    .frame(
                        minWidth: 0,
                        maxWidth: .infinity,
                        minHeight: 0,
                        maxHeight: .infinity,
                        alignment: .center
                    )
                    // placement helps always display search bar when scroll
                    .searchable(text: $searchQuery, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search Restaurants By Name") {
                        // suggestions for user when typing
                        ForEach(filteredSearchRestaurant) { rest in
                            HStack(spacing: 4) {
                                Image(systemName: "magnifyingglass")
                                    .padding(.trailing, 10)
                                Text("Are you looking for")
                                    .foregroundColor(.black)
                                Text(rest.name)
                                    .bold()
                                    .lineLimit(1)
                                    .foregroundColor(Color("RestDetailTitleColor"))
                                
                            }
                                .searchCompletion(rest.name)
                        }
                    }
                }
                MapDisplayButton(isShowingMap: $isShowingMap)
            }
                .navigationTitle("EAT TIME!!")
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