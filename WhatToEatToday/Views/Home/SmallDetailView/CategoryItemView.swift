//
//  CategoryItemView.swift
//  WhatToEatToday
//
//  Created by Nhung Tran on 31/07/2022.
//

import SwiftUI

struct CategoryItemView: View {
    var name: String
    private let iconSize: CGFloat = 55
    let gradient = Gradient(colors: [.white, .white.opacity(0.9)])

    
    var body: some View {
        VStack(alignment: .center) {
            Image("Icon \(name)")
                .resizable()
                .aspectRatio(contentMode: .fill)
//                .background(LinearGradient(gradient: gradient, startPoint: .topLeading, endPoint: .bottomTrailing))
//                .clipShape(Circle())
                .frame(width: iconSize, height: iconSize)
                .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.2), radius: 2, x: 1, y: 3)
            Text(name)
                .font(.headline)
                .multilineTextAlignment(.center)
            
        }
    }
}

struct CategoryItemView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItemView(name: "Bobapop")
            .environmentObject(RestaurantModel())
    }
}
