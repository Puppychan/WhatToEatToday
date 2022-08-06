//
//  FoodView.swift
//  WhatToEatToday
//
//  Created by Nhung Tran on 26/07/2022.
//
// ref: https://stackoverflow.com/questions/59158476/how-to-have-text-in-shapes-in-swiftui
//https://blckbirds.com/post/stretchy-header-and-parallax-scrolling-in-swiftui/


import SwiftUI

struct RestaurantDetailView: View {

    var rest: Restaurant
    @State var imageHeight: CGFloat = 0
//    @State var isFoodDetailShowing = false
    @State var imageScale = 1.0
    @EnvironmentObject var model: RestaurantModel
    var body: some View {
        ScrollView {
            // add display gone or not gone
            LazyVStack(alignment: .leading, spacing: 0) {

                // MARK: - Restaurant Info
                VStack {
                    // MARK: restaurant cover image
                    // for adding effect to the image
                    GeometryReader { geo in
                        ZStack(alignment: .center) {

                            if geo.frame(in: .global).minY <= 0 {
                                // scroll down outside the screen -> move image up
                                Image("\(rest.name)-bck")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                
                                // move image up
                                .offset(y: geo.frame(in: .global).minY / 9)
                                    .clipped()

                            }
                            else {
                                // scroll up -> increase image size + move image down
                                Image("\(rest.name)-bck")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .scaleEffect(1 + geo.frame(in: .global).minY / 500) // change scale of image
                                    .clipped()
                                    // move image down
                                    .offset(y: -geo.frame(in: .global).minY)
                                    .animation(.easeInOut.delay(2), value: imageScale)
                                    .background(Color("RestDetailImageBckColor").opacity(0.4))
                            }
                        }
                        // for fixing the text stand on the image bug
//                        .frame(height: 450)
                        .frame(height: 600, alignment: .center)
                            .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.1), radius: 5, x: 3, y: 3)

                    }
//                    .frame(height: 457)
                    .frame(height: 603, alignment: .center)



                    VStack(alignment: .leading, spacing: 13) {
                        // MARK: restaurant name
                        Text(rest.name)
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(Color("RestDetailTitleColor"))

                        // MARK: restaurant address -> display map
                        HStack(spacing: 3) {
                            Image(systemName: "mappin.and.ellipse")
                                .foregroundStyle(Color("RestDetailIconColor"))
                                .symbolRenderingMode(.hierarchical)
                                .font(.title3)
                            Text(rest.address)
                                .foregroundColor(Color("RestDetailAddColor"))
                                .font(.headline)
                                .lineLimit(1)

                            Spacer()

                            // MARK: restaurant rating
                            RatingView(rest: rest, fontSize: .title3)
                            Spacer()
                        }


                        // MARK: restaurant description
                        // need add read more
                        Text(rest.description)
                            .lineSpacing(5)
                            .lineLimit(3)
                            .font(.body)
                            .foregroundColor(Color("RestDetailDescColor"))
                    }
                        .padding()
                }


                // MARK: - Food list with category
                FoodListView(rest: rest)

            }
        }
            .ignoresSafeArea()
    }
}




//            ExpandableText(text: "Do you think you're living an ordinary life? You are so mistaken it's difficult to even explain. The mere fact that you exist makes you extraordinary. The odds of you existing are less than winning the lottery, but here you are. Are you going to let this extraordinary opportunity pass?")
//                        .font(.body)//optional
//                        .foregroundColor(.primary)//optional
//                        .lineLimit(3)//optional
//                        .animation(.easeOut)//optional
//                        .padding(.horizontal, 24)//optional


