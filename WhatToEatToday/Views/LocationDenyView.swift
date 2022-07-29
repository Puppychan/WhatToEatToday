//
//  LocationDenyView.swift
//  WhatToEatToday
//
//  Created by Nhung Tran on 29/07/2022.
//

import SwiftUI

struct LocationDenyView: View {
    var body: some View {
        
        VStack (spacing: 20) {
            
            Spacer()
            GifView(name: "cat-eat")
                .frame(width: 250, height: 200)
            Text("Please allow us to access your location to use the app")
                
            Button {
                // Open settings by getting the settings url
                if let url = URL(string: UIApplication.openSettingsURLString) {
                    if UIApplication.shared.canOpenURL(url) {
                       // If we can open this settings url, then open it
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    }
                }
                
            } label: {
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
            }
            .padding()

            
            Spacer()
        }
        .foregroundColor(.white)
        .multilineTextAlignment(.center)
        .background(Color("DenyLocationBckColor"))
        .ignoresSafeArea(.all, edges: .all)
        
    }
}

struct LocationDenyView_Previews: PreviewProvider {
    static var previews: some View {
        LocationDenyView()
    }
}
