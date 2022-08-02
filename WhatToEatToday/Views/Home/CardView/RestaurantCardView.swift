//
//  BasicRestaurantCardView.swift
//  WhatToEatToday
//
//  Created by Nhung Tran on 26/07/2022.
//

import SwiftUI

struct RestaurantCardView: View {
    var rest: Restaurant
    var cardWidth: CGFloat
    var cardHeight: CGFloat
    var displayType: String
    var body: some View {
        // Card content
        // add display gone or not gone
        VStack(alignment: .center, spacing: 5) {

            // MARK: cover image
            Image("\(rest.name)-bck")
                .resizable()
                .scaledToFill()
                .frame(width: cardWidth, height: cardHeight)
//                .aspectRatio(CGSize(width: cardWidth, height: cardHeight), contentMode: .fill)
                .cornerRadius(20)
                .clipped()

            // text
            HStack {
                VStack(alignment: .leading, spacing: 0) {
                    Spacer()
                    
                    // MARK: restaurant name
                    Text(rest.name)
                        .font(displayType == "all" ? .title2 : .title3)
                        .bold()
                        .lineLimit(1)
                        .foregroundColor(Color("RestCardTitleColor"))
                    HStack(spacing: 9) {
                        
                        // MARK: restaurant rating
                        RatingView(rest: rest)

                        Text("•")
                            .font(.headline)
                            .bold()
                            .foregroundColor(.black)
                        
                        if displayType == "all" {
                            
                            // MARK: restaurant category
                            Text(rest.categories[0])
                                .foregroundColor(Color("RestCardCaptColor"))
                                .italic()
                        }
                        else {
                            // MARK: price
                            Text(rest.findPriceRange())
                                .font(.subheadline)
                                .foregroundColor(Color("RestCardPriceColor"))
                        }
                    }
                        .font(.subheadline)
                }

                Spacer()
                VStack(spacing: 0) {
                    Spacer()
                    // MARK: restaurant price range
                    if displayType == "all" {
                        Label(rest.findPriceRange(), systemImage: "dollarsign.circle")
                            .font(.subheadline)
                            .foregroundColor(Color("RestCardPriceColor"))
                    }

                }

            }
            // MARK: divider
            if displayType == "all" {
                Divider()
                    .frame(height: 1.7)
                    .overlay(Color("RestCardBorderColor"))
                    .cornerRadius(10)
                    .padding(.bottom)                
            }
        }
        .frame(width: cardWidth)

    }
}
