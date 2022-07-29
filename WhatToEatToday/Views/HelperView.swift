//
//  HelperView.swift
//  WhatToEatToday
//
//  Created by Nhung Tran on 29/07/2022.
//
// https://stackoverflow.com/questions/60527932/remove-back-button-text-from-navigationbar-in-swiftui

import SwiftUI

// Remove back text on navigation bar title
extension UINavigationController {
    // Remove back button text
    open override func viewWillLayoutSubviews() {
        navigationBar.topItem?.backButtonDisplayMode = .minimal
    }
}
