//
//  FoodDetailView.swift
//  WhatToEatToday
//
//  Created by Nhung Tran on 29/07/2022.
//

import SwiftUI

struct FoodDetailView: View {
    var food: Food
    var rest: Restaurant
    @EnvironmentObject var model: RestaurantModel
    var body: some View {
        // MARK: food information
        VStack(spacing: 0) {
            // image
            Image("\(rest.name)-\(food.name)")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 300)
                .clipped()

            // information
            VStack(alignment: .leading, spacing: 3) {
                Text(food.name)
                    .font(.headline)
                    .lineLimit(nil)
                    .lineSpacing(1)

                // Description
//                Text(food.description)
//                    .lineLimit(1)
//                    .font(.body)
//                    .foregroundColor(Color("FoodCardDescriptionColor"))
                let descArr = UltilityModel.splitStringComma(food.description)
                if descArr.count < 10 {
                    ForEach(0..<descArr.count, id: \.self) { index in
                        HStack {
                            Text("❃")
                                .font(.custom("Avenir", size: 20))
                            Text("\(descArr[index].capitalized)")
                                .font(.custom("Avenir", size: 17))
                        }
                    }
                } else {
                    ForEach(0..<descArr.count, id: \.self) { index in
                        HStack {
                            Text("❃")
                                .font(.custom("Avenir", size: 20))
                            Text("\(descArr[index].capitalized)")
                                .font(.custom("Avenir", size: 17))
                        }
                    }
                }

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
