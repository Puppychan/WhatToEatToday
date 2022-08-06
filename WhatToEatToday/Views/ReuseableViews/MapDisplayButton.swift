//
//  MapDisplayButtonView.swift
//  WhatToEatToday
//
//  Created by Nhung Tran on 02/08/2022.
//

import SwiftUI

struct MapDisplayButton: View {
    @Binding var isShowingMap: Bool
    private let frameSize: CGFloat = 80
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                NavigationLink(destination: {
                    MapView()
                }, label: {
                        ZStack {
                            Circle()
                                .foregroundColor(Color("MapButtonBckColor"))
                            Image(systemName: "map.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: frameSize - 37)
                                .foregroundColor(Color("MapButtonColor"))
                        }
                            .frame(width: frameSize, height: frameSize)
                    })
            }
                .padding()
        }

    }
}
