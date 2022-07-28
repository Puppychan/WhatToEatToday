//
//  BasicRestaurantCardView.swift
//  WhatToEatToday
//
//  Created by Nhung Tran on 26/07/2022.
//

import SwiftUI

struct RestaurantCardView: View {
    var rest: Restaurant
    var body: some View {
        let cardWidth = CGFloat(357), cardHeight = CGFloat(340)
        // Card content
        VStack(alignment: .center, spacing: 5) {

            // MARK: cover image
            Image("\(rest.name)-bck")
                .resizable()
                .scaledToFill()
                .frame(width: cardWidth, height: cardHeight)
                .cornerRadius(20)
                .clipped()

            // text
            HStack {
                VStack(alignment: .leading, spacing: 0) {
                    Spacer()
                    // MARK: restaurant name
                    Text(rest.name)
                        .font(.title2)
                        .bold()
                        .lineLimit(1)
                        .foregroundColor(Color("RestCardTitleColor"))
                    HStack(spacing: 9) {
                        // MARK: restaurant rating
                        HStack(spacing: 4) {
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                                .font(.headline)
                            Text("\(String(rest.rating))")
                                .foregroundColor(Color("RestCardCaptColor"))
                        }

                        Text("•")
                            .font(.headline)
                            .bold()
                            .foregroundColor(.black)

                        // MARK: restaurant category
                        Text(rest.categories[0])
                            .foregroundColor(Color("RestCardCaptColor"))
                            .italic()
                    }
                        .font(.subheadline)
                }

                Spacer()
                VStack(spacing: 0) {
                    Spacer()
                    // MARK: restaurant price range
                    Label(rest.findPriceRange(), systemImage: "dollarsign.circle")
                        .font(.subheadline)
                        .foregroundColor(Color("RestCardPriceColor"))

                }

            }
            Divider()
                .frame(height: 2)
                .overlay(Color("RestCardBorderColor"))
                .cornerRadius(10)
                .padding(.bottom)
        }
            .frame(width: cardWidth)


    }
}

struct RestaurantCardView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantCardView(rest: Restaurant())
    }
}
