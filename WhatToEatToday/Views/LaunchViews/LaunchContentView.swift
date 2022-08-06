//
//  LaunchContentView.swift
//  WhatToEatToday
//
//  Created by Nhung Tran on 29/07/2022.
//

import SwiftUI

struct LaunchContentView: View {
    @EnvironmentObject var model: RestaurantModel
    var openSetting = false
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color("DenyLocationBckColor"))
            VStack (spacing: 30) {

                Spacer()

                // MARK: Name of the app
                AppNameView()


                // MARK: open setting button
                Button {
                    if openSetting {
                        // Open settings by getting the settings url
                        if let url = URL(string: UIApplication.openSettingsURLString) {
                            if UIApplication.shared.canOpenURL(url) {
                                // If we can open this settings url, then open it
                                UIApplication.shared.open(url, options: [:], completionHandler: nil)
                            }
                        }
                    }
                    else {
                        model.requestGeolocationPermission()
                    }

                } label: {
                    ZStack {
                        Rectangle()
                            .foregroundColor(.black)
                            .frame(height: 50)
                            .cornerRadius(15)
                            .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.3), radius: 10, x: -5, y: 5)

                        Text("Let's Eat")
                            .bold()
                            .foregroundColor(.white)
                            .padding()
                    }
                    
                     
                }


                // MARK: gif
                GifView(name: "cat-eat")
                    .frame(width: 173, height: 142)


                Spacer()
            }
                .frame(width: 250)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
        }
            .ignoresSafeArea(.all, edges: .all)
    }
}
