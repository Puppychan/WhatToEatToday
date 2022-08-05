//
//  FoodView.swift
//  WhatToEatToday
//
//  Created by Nhung Tran on 27/07/2022.
//

import SwiftUI

struct FoodCardView: View {
    var food: Food
    var rest: Restaurant
    var body: some View {
        ZStack {
            // what if no image??
            //MARK: container
            Rectangle()
                .foregroundColor(.white)

            // MARK: food information
            HStack(spacing: 0) {

                // information
                VStack(alignment: .leading, spacing: 3) {
                    Text(food.name)
//                        .font(Font.custom("Avenir", size: 15))
                        .font(.headline)
                        .lineLimit(2)
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
                
                // image
                Image("\(rest.name)-\(food.name)")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 140, height: 110)
                    .clipped()
            }
            

        }
//        .aspectRatio(CGSize(width: 150, height: 100), contentMode: .fit)
        .frame(minHeight: 110)
        .cornerRadius(15)
        .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.17), radius: 10, x: -5, y: 10)
        
    }
}
