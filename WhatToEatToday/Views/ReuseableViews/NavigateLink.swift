//
//  RestaurantLinkView.swift
//  WhatToEatToday
//
//  Created by Nhung Tran on 31/07/2022.
//

import SwiftUI

struct NavigateLink: View {
    var destinationView: AnyView
    var labelView: AnyView
    var navigateMethod: () -> Void
    var body: some View {
        NavigationLink(destination: {
            destinationView
                .onAppear() {
                navigateMethod()
            }
        }, label: {
                // MARK: restaurant basic card
                labelView
            })
    }
}
