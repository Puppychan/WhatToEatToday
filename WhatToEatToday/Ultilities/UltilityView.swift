//
//  UltilityView.swift
//  WhatToEatToday
//
//  Created by Nhung Tran on 05/08/2022.
//https://stackoverflow.com/questions/60527932/remove-back-button-text-from-navigationbar-in-swiftui
// https://www.codebales.com/swiftui-background-image-with-gradient-tint
// https://stackoverflow.com/questions/40667985/how-to-hide-the-navigation-bar-and-toolbar-as-scroll-down-swift-like-mybridge

import Foundation
import SwiftUI

// MARK: Remove "back" text on navigation bar title
extension UINavigationController {
    // Remove back button text
    open override func viewWillLayoutSubviews() {
        navigationBar.topItem?.backButtonDisplayMode = .minimal
    }

    // Hide on scroll
    override open func viewDidLoad() {
        super.viewDidLoad()
//        hidesBarsOnSwipe = true
        // Change navigation back color
        navigationBar.tintColor = UIColor(named: "RestDetailTitleColor")
    }
}


// MARK: add gradient to shadow
extension Color {
    static var gradient: Array<Color> {
        return [
            Color(red: 37 / 255, green: 37 / 255, blue: 37 / 255, opacity: 1.0),
            Color(red: 37 / 255, green: 37 / 255, blue: 37 / 255, opacity: 0.7),
            Color(red: 37 / 255, green: 37 / 255, blue: 37 / 255, opacity: 0.5),
            Color(red: 37 / 255, green: 37 / 255, blue: 37 / 255, opacity: 0.2),
            Color(red: 5 / 255, green: 5 / 255, blue: 5 / 255, opacity: 1.0)
        ]
    }
}