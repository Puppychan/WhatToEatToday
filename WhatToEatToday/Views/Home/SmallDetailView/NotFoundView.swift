//
//  NotFoundView.swift
//  WhatToEatToday
//
//  Created by Nhung Tran on 31/07/2022.
//

import SwiftUI

struct NotFoundView: View {
    var body: some View {
        VStack {
            Image("404 Not Found")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text("Oops Cannot Found The Result")
                .font(.title)
                .bold()
                .foregroundColor(Color("NotFoundColor"))
                .multilineTextAlignment(.center)
            
        }
    }
}

struct NotFoundView_Previews: PreviewProvider {
    static var previews: some View {
        NotFoundView()
            .environmentObject(RestaurantModel())
    }
}
