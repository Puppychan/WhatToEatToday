//
//  MapListView.swift
//  WhatToEatToday
//
//  Created by Nhung Tran on 03/08/2022.
//

import SwiftUI

struct MapListView: View {
    @Binding var isShowingMap: Bool
    @EnvironmentObject var model: RestaurantModel
    @State var selected: Int = 0
    var body: some View {
        ZStack {
            MapView()
            VStack {
                Spacer()

//                ScrollViewReader { proxy in
//                    ScrollView(.horizontal) {
//                        HStack {
//                            ForEach(model.restaurants.indices, id: \.self) { index in
//                                RestaurantCardView(rest: model.restaurants[index], cardWidth: 340, cardHeight: 127, displayType: "all")
//                                    .frame(height: 200)
//                                    .id(index)
//                            }
//                        }
//                            .onChange(of: index) { value in
//                            withAnimation {
//                                proxy.scrollTo(value, anchor: .center)
//                            }
//                        }
//                    }
//                }
                    
                TabView(selection: $selected) {
                    HStack {
                        ForEach(0..<model.restaurants.count, id: \.self) { index in
                            RestaurantCardView(rest: model.restaurants[index], cardWidth: 300, cardHeight: 127, displayType: "all")
                                .frame(height: 130)
                                .tag(index)
                        }
                    }
                }
//                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
//                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
//                    .frame(height: 350)
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
        }
    }
}
