//
//  FoodListView.swift
//  WhatToEatToday
//
//  Created by Nhung Tran on 29/07/2022.
//

import SwiftUI

struct FoodListView: View {
    @EnvironmentObject var model: RestaurantModel
    @State var isFoodDetailShowing = false
    var rest: Restaurant
    var body: some View {
        LazyVStack(alignment: .leading) {
            let categories = model.findAllCategories(rest.id)
            ForEach(categories.indices, id: \.self) { index in
                // MARK: category name
                Text(categories[index].uppercased())
                    .bold()
                    .foregroundColor(.white)
                    .font(.title2)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding()
                    .multilineTextAlignment(.center)
                    .background(ArrowShape()
                        .fill(Color("CategoryTitleBckColor"))
                        .shadow(radius: 10))
                    .padding(.top, index == 0 ? 30 : 40)


                // MARK: food display following its category
                LazyVStack(alignment: .leading, spacing: 17) {
                    ForEach(rest.foodList) { food in
                        if (food.category == categories[index]) {
                            Button(action: {
                                self.isFoodDetailShowing = true
                                model.navigateFood(food.id, rest.id)
                            }, label: {
                                FoodCardView(food: food)
                            })
                            .sheet(isPresented: $isFoodDetailShowing, content: {
                                FoodDetailView(food: model.currentFood ?? Food(), rest: rest)
                            })
                            // for user style not button auto style
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                }
                    .padding()

            }

        }
    }
}
