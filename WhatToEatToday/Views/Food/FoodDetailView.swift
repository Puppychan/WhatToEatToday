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
    @Binding var isFoodDetailShowing: Bool
    @EnvironmentObject var model: RestaurantModel
    var body: some View {
        // MARK: food information
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                
                ZStack {
                    // MARK: image
                    Image("\(rest.name)-\(food.name)")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: UIScreen.main.bounds.width)
                        .clipped()
                    
                    // MARK: close button
                    Button(action: {
                        isFoodDetailShowing.toggle()
                    }, label: {
                        Image(systemName: "xmark.circle.fill")
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(.white, Color("CloseXBckColor").opacity(0.5))
                            .font(.system(size: 40))
                            .position(x: 30, y: 30)
                    })
                    
                }
                
                VStack(alignment: .leading) {
                    // MARK: food name
                    Text(food.name)
                        .font(.title)
                        .bold()
                        .foregroundColor(Color("RestDetailTitleColor"))
                        .lineLimit(2)
                        .lineSpacing(1)
                        .padding(.horizontal)
                    
                    // MARK: Price
                    Text("\(food.price) VND")
                        .font(.headline)
                        .foregroundColor(Color("FoodCardDescriptionColor"))
                        .padding(.horizontal)
                }
                
                
                VStack(alignment: .leading, spacing: 3) {
                    // MARK: Description
                    IngredientsView(descArr: UltilityModel.splitStringComma(food.description))
                    
                    
                }
                .padding(.horizontal)
                
                Spacer()
                
                
            }
            .frame(minHeight: 110)
            .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.17), radius: 10, x: -5, y: 10)
            .onAppear {
                model.navigateFood(food.id, rest.id)
            }

        }

    }
}
//struct FoodDetailView_Previews: PreviewProvider {
//    static let model = RestaurantModel()
//    static var previews: some View {
//        FoodDetailView(food: model.restaurants[0].foodList[0], rest: model.restaurants[0])
//            .environmentObject(RestaurantModel())
//    }
//}
