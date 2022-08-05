//
//  FoodDetailView.swift
//  WhatToEatToday
//
//  Created by Nhung Tran on 29/07/2022.
//

import SwiftUI

struct FoodDetailView: View {
    var food : Food
    var rest: Restaurant
    @EnvironmentObject var model: RestaurantModel
    var body: some View {
        // MARK: food information
        VStack(spacing: 0) {
            // image
            Image("\(rest.name)-\(food.name)")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 400)
                .clipped()

            // information
            VStack(alignment: .leading, spacing: 3) {
                Text(food.name)
//                        .font(Font.custom("Avenir", size: 15))
                    .font(.headline)
                    .lineLimit(nil)
                    .lineSpacing(1)
                
                // Description
                Text(food.description)
                    .lineLimit(1)
                    .font(.body)
                    .foregroundColor(Color("FoodCardDescriptionColor"))

                // Price
                Text("\(food.price)")
                    .font(.subheadline)
                    .foregroundColor(Color("FoodCardPriceColor"))
                    .bold()
            }
            .padding()
            Spacer()
            

        }
        .frame(minHeight: 110)
        .cornerRadius(15)
        .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.17), radius: 10, x: -5, y: 10)
        .onAppear {
            model.navigateFood(food.id, rest.id)
        }

    }
}
struct FoodDetailView_Previews: PreviewProvider {
    static let model = RestaurantModel()
    static var previews: some View {
        FoodDetailView(food: model.restaurants[0].foodList[0], rest: model.restaurants[0])
            .environmentObject(RestaurantModel())
    }
}
