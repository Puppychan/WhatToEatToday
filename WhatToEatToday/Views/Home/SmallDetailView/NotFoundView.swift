//
//  NotFoundView.swift
//  WhatToEatToday
//
//  Created by Nhung Tran on 31/07/2022.
//

import SwiftUI

struct NotFoundView: View {
    var message: String = "Oops Cannot Found The Result"
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            Image("404 Not Found")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200)
            Text(.init(message))
                .font(.title3)
                .bold()
                .foregroundColor(Color("NotFoundColor"))
                .multilineTextAlignment(.center)
            Spacer()

        }
            .opacity(0.5)
            .frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity,
            alignment: .center)
    }
}

struct NotFoundView_Previews: PreviewProvider {
    static var previews: some View {
        NotFoundView()
            .environmentObject(RestaurantModel())
    }
}
