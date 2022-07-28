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
        ZStack(alignment: .leading) {
            
            // Card content
            VStack(alignment: .leading, spacing: 5) {
                
                // image
                    Image("\(rest.name)-bck")
                        .resizable()
                        .scaledToFill()
                        .frame(width: cardWidth, height: cardHeight)
                        .clipped()
                        .cornerRadius(20)
                
                // text
                VStack(alignment: .leading, spacing: 3) {
                    Text(rest.name)
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(Color("TitleRestaurantCardColor"))
                    Text(rest.categories[0])
                        .font(.title3)
                        .foregroundColor(Color("SubtitleColor"))
                }
            }
        }
        .frame(width: cardWidth)
        
    }
}

struct RestaurantCardView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantCardView(rest: Restaurant())
    }
}
