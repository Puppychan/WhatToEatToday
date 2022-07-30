//
//  FoodView.swift
//  WhatToEatToday
//
//  Created by Nhung Tran on 26/07/2022.
//
// ref: https://stackoverflow.com/questions/59158476/how-to-have-text-in-shapes-in-swiftui


import SwiftUI


struct RestaurantDetailView: View {
    var rest: Restaurant
    @State var imageHeight : CGFloat = 0
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
                    Image("\(rest.name)-bck")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                    // for changing scale of image when scroll
                        .scaleEffect(imageScale)
                        .animation(.default.delay(1.3), value: imageScale)
                        .clipped()
                    
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
//        .simultaneousGesture(
//           DragGesture()
//            .onChanged { value in
//              if value.translation.height > 0 {
//                 print("Scroll down")
////                  imageScale += 0.1
//                  imageScale = value.translation.height
//
//              }
//               else {
//                   imageScale = 1.0
//               }
//           }
//
//        )
        .ignoresSafeArea()
    }
}

struct FoodView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantDetailView(rest: Restaurant())
            .environmentObject(RestaurantModel())
    }
}




//            ExpandableText(text: "Do you think you're living an ordinary life? You are so mistaken it's difficult to even explain. The mere fact that you exist makes you extraordinary. The odds of you existing are less than winning the lottery, but here you are. Are you going to let this extraordinary opportunity pass?")
//                        .font(.body)//optional
//                        .foregroundColor(.primary)//optional
//                        .lineLimit(3)//optional
//                        .animation(.easeOut)//optional
//                        .padding(.horizontal, 24)//optional


