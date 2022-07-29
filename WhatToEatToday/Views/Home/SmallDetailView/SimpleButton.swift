//
//  SimpleButton.swift
//  WhatToEatToday
//
//  Created by Nhung Tran on 29/07/2022.
//

import SwiftUI

struct SimpleButton: View {
    var bckColor: Color = Color.black
    var textColor: Color = Color.white
    var message: String = ""
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(bckColor)
                .frame(height: 50)
                .cornerRadius(15)
                .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.3), radius: 10, x: -5, y: 5)
            
            Text(message)
                .bold()
                .foregroundColor(textColor)
                .padding()
        }
        
    }
}
