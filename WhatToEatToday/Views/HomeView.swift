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
    var body: some View {

        NavigationView {
            
            VStack {
                VStack(alignment: .leading) {
                    Text("All Restaurants")
                        .font(.largeTitle)
                        .foregroundColor(Color("TitleColor"))
                        .bold()
                    ScrollView {
                        VStack(spacing: 40) {
                            ForEach(model.restaurants.indices, id: \.self) { index in
                                NavigationLink(destination: {
                                    RestaurantDetailView(rest: model.restaurants[index])
                                        .onAppear() {
                                            model.navigateRestaurant(model.restaurants[index].id)
                                        }
                                }, label: {
                                    // MARK: restaurant basic card
                                    RestaurantCardView(rest: model.restaurants[index])
                                })
                                
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
       
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(RestaurantModel())
    }
}
