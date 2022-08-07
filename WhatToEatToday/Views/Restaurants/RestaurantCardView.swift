//
//  BasicRestaurantCardView.swift
//  WhatToEatToday
//
//  Created by Nhung Tran on 26/07/2022.
//

import SwiftUI

struct RestaurantCardView: View {
    var rest: Restaurant
    @EnvironmentObject var model: RestaurantModel
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
                .cornerRadius(10)
                .clipped()

            // MARK: Text
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    // MARK: restaurant name
                    Text(rest.name)
                        .font(displayType == "all" ? .title2 : .title3)
                        .bold()
                        .lineLimit(1)
                        .foregroundColor(Color("RestCardTitleColor"))
                    Spacer()
                    if displayType == "all" {
                        // MARK: distance
                        Label("\(model.calculateDistanceRest(rest), specifier: "%.2f") km", systemImage: "car")
                            .foregroundColor(Color("RestCardCaptColor"))
                            .font(.subheadline)
                    }
                    
                }
                .padding(.top, 10)

                Spacer()
                HStack(spacing: 0) {
                    HStack(spacing: 5) {
                        
                        // MARK: restaurant rating
                        RatingView(rest: rest)

                        Text("•")
                            .font(.headline)
                            .bold()
                            .foregroundColor(.black)
                        
                        // MARK: restaurant category
                        if displayType == "all" {
                            Text(rest.categories[0])
                                .foregroundColor(Color("RestCardCaptColor"))
                                .italic()
                        }
                        // MARK: price
                        else {
                            Text(rest.findPriceRange())
                                .font(.subheadline)
                                .foregroundColor(Color("RestCardPriceColor"))
                        }
                    }
                    Spacer()
                    // MARK: restaurant price range
                    if displayType == "all" {
                        Text("＄\(rest.findPriceRange())")
                            .foregroundColor(Color("RestCardPriceColor"))
                    }

                }
                .font(.subheadline)

            }
            .frame(width: cardWidth)
            
            // MARK: divider
            if displayType == "all" {
                Divider()
                    .frame(width: cardWidth, height: 1.7)
                    .overlay(Color("RestCardBorderColor"))
                    .cornerRadius(10)
                    .padding(.vertical, 10)
            }
        }
        .background(Color("RestCardBckColor"))
        .cornerRadius(20)
        .padding(.horizontal)
        .frame(width: cardWidth)

    }
}
