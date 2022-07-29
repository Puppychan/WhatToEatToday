//
//  LaunchContentView.swift
//  WhatToEatToday
//
//  Created by Nhung Tran on 29/07/2022.
//

import SwiftUI

struct LaunchContentView: View {
    @EnvironmentObject var model : RestaurantModel
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

                } label: { SimpleButton(message: "Get Started") }


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

struct LaunchContentView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchContentView()
    }
}
