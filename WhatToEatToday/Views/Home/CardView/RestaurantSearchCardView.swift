//
//  RestaurantSearchCardView.swift
//  WhatToEatToday
//
//  Created by Nhung Tran on 29/07/2022.
//

import SwiftUI

struct RestaurantSearchCardView: View {
    var rest: Restaurant
    var body: some View {
        ZStack {
            //MARK: container
            Rectangle()
                .foregroundColor(.white)

            // MARK: restaurant information
            HStack(spacing: 0) {

                // image
                Image("\(rest.name)-bck")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 140)
                    .clipped()
                Spacer()
                
                VStack(alignment: .leading) {
                    Text(rest.name)
                        .font(.title3)
                        .bold()
                        .lineLimit(1)
                        .foregroundColor(Color("RestCardTitleColor"))
                    RatingView(rest: rest)
                }
                Spacer()
            }
            

        }
//        .aspectRatio(CGSize(width: 150, height: 100), contentMode: .fit)
        .frame(height: 130)
        .cornerRadius(15)
        .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.17), radius: 10, x: -5, y: 10)
    }
}

struct RestaurantSearchCardView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantSearchCardView(rest: Restaurant())
    }
}
