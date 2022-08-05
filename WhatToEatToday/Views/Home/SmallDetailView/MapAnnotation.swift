//
//  MapAnnotationView.swift
//  TestAsm1
//
//  Created by Nhung Tran on 03/08/2022.
//

import SwiftUI

struct MapAnnotation: View {
    @State var isShowing = false
    var rest: Restaurant
    var showMap: () -> Void
    var body: some View {
        VStack(spacing: 10) {
            ZStack {
                Rectangle()
                    .foregroundColor(.white)
                HStack {
                    Text(rest.address)
                        .lineLimit(1)
                        .font(.subheadline)
                        .frame(width: 120)
                    Image(systemName: "location.fill.viewfinder")
                        .font(.headline)
                        .onTapGesture {
                            isShowing = false
                            showMap()
                        }
                }
                    .foregroundColor(.black)
                    .padding(7)

            }
                .frame(height: 50)
                .cornerRadius(10)
                .opacity(isShowing ? 1 : 0)
            Image("marker")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
                .onTapGesture {
                isShowing.toggle()
            }
        }
    }
}
