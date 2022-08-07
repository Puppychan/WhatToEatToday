/*
    RMIT University Vietnam
    Course: COSC2659 iOS Development
    Semester: 2022B
    Assessment: Assignment 2
    Author: Tran Mai Nhung
    ID: s3879954
    Created  date: 07/08/2022
    Last modified: 07/08/2022
    Acknowledgement:
 - Canvas, CodeWithChris Course
*/

import SwiftUI

struct ImageShadowView: View {
    var opacity = 0.45
    var body: some View {
        Rectangle()
            .foregroundColor(.clear)
            .background(LinearGradient(gradient: Gradient(colors: Color.gradient), startPoint: .top, endPoint: .bottom))
            .opacity(opacity)

    }
}
