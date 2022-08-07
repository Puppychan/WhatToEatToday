//
//  RestNameView.swift
//  WhatToEatToday
//
//  Created by Nhung Tran on 29/07/2022.
//

import SwiftUI

struct AppNameView: View {
    var txtColor: Color = Color.white
    let circleFrame: CGFloat = 330
    var body: some View {
        ZStack {
//            Circle()
//                .frame(width: circleFrame, height: circleFrame)
            Image("launch")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipShape(Circle())
                .frame(width: circleFrame, height: circleFrame)
                .brightness(-0.39)
                .contrast(0.5)
                .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 10, x: -5, y: 5)
                
                
            VStack (alignment: .center, spacing: 0) {
                ForEach(["Eat", "Time"], id: \.self) { word in
                    Text(word.uppercased())
                        .font(Font.custom("GermaniaOne-Regular", size: 100))
                        .tracking(2)
                        .bold()
                        .foregroundColor(txtColor)
                        .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 10, x: -5, y: 5)
                }
                
                
            }
        }
    }
}

