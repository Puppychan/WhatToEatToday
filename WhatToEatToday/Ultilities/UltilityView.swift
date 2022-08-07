/*
    RMIT University Vietnam
    Course: COSC2659 iOS Development
    Semester: 2022B
    Assessment: Assignment 2
    Author: Tran Mai Nhung
    ID: s3879954
    Created  date: 05/08/2022
    Last modified: 07/08/2022
    Acknowledgement:
- Canvas, CodeWithChris Course
- https://stackoverflow.com/questions/60527932/remove-back-button-text-from-navigationbar-in-swiftui
- https://www.codebales.com/swiftui-background-image-with-gradient-tint
- https://stackoverflow.com/questions/40667985/how-to-hide-the-navigation-bar-and-toolbar-as-scroll-down-swift-like-mybridge
*/

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
//            Color(red: 37 / 255, green: 37 / 255, blue: 37 / 255, opacity: 1.0),
            Color(red: 37 / 255, green: 37 / 255, blue: 37 / 255, opacity: 0.53),
            Color(red: 37 / 255, green: 37 / 255, blue: 37 / 255, opacity: 0.5),
            Color(red: 37 / 255, green: 37 / 255, blue: 37 / 255, opacity: 0.3),
            Color(red: 37 / 255, green: 37 / 255, blue: 37 / 255, opacity: 0.2),
            Color(red: 37 / 255, green: 37 / 255, blue: 37 / 255, opacity: 0.1),
            Color(red: 37 / 255, green: 37 / 255, blue: 37 / 255, opacity: 0),
            Color(red: 37 / 255, green: 37 / 255, blue: 37 / 255, opacity: 0),
            Color(red: 37 / 255, green: 37 / 255, blue: 37 / 255, opacity: 0)
        ]
    }
}
