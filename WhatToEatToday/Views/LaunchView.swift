//
//  LaunchView.swift
//  WhatToEatToday
//
//  Created by Nhung Tran on 29/07/2022.
//

import SwiftUI

struct LaunchView: View {
    @EnvironmentObject var model: RestaurantModel
    @State private var opacity = 0.5

    // Customise your SplashScreen here
    var body: some View {
        if model.authorizationState == .notDetermined {
            VStack {
                Spacer()

                Text("Eat What Today???")
                    .font(Font.custom("Avenir", size: 26))
                    .foregroundColor(.white)
                GifView(name: "eatwhat")
                    .frame(width: 250, height: 200)

                Button(action: {
                    model.requestGeolocationPermission()
                }, label: {
                        ZStack {
                            Rectangle()
                                .foregroundColor(.black)
                                .frame(height: 48)
                                .cornerRadius(10)

                            Text("Open Settings")
                                .bold()
                                .foregroundColor(.white)
                                .padding()
                        }
                            .padding()
                    })

                Spacer()
            }
                .opacity(opacity)
                .onAppear {
                withAnimation(.easeIn(duration: 1.2)) {
                    self.opacity = 1.00
                }
            }
                .background(Color("DenyLocationBckColor"))

        }
        else if model.authorizationState == .authorizedAlways || model.authorizationState == .authorizedWhenInUse {
            HomeView()
        }
        else {
            LocationDenyView()
        }

    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
