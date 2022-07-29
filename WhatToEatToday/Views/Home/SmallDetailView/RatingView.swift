//
//  RatingView.swift
//  WhatToEatToday
//
//  Created by Nhung Tran on 29/07/2022.
//

import SwiftUI

struct RatingView: View {
    var rest: Restaurant
    var iconFontSize = Font.headline
    var fontSize = Font.headline
    var body: some View {
        HStack(spacing: 4) {
            Image(systemName: "star.fill")
                .foregroundColor(.yellow)
                .font(iconFontSize)
            Text("\(String(rest.rating))")
                .foregroundColor(Color("RestCardCaptColor"))
                .font(fontSize)
        }
    }
}
