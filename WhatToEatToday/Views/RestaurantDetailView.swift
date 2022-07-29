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
    @EnvironmentObject var model: RestaurantModel
    var body: some View {
        ScrollView {

            LazyVStack(alignment: .leading, spacing: 0) {

                // MARK: - Restaurant Info
                VStack {
                    // MARK: restaurant cover image
                    Image("\(rest.name)-bck")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                    VStack(alignment: .leading, spacing: 13) {
                        // MARK: restaurant name
                        Text(rest.name)
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(Color("RestDetailTitleColor"))

                        // MARK: restaurant address
                        HStack(spacing: 3) {
                            Image(systemName: "mappin.and.ellipse")
                                .foregroundStyle(Color("RestDetailIconColor"))
                                .symbolRenderingMode(.hierarchical)
                                .font(.title3)
                            Text(rest.address)
                                .foregroundColor(Color("RestDetailAddColor"))
                                .font(.headline)
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
                LazyVStack(alignment: .leading) {
                    let categories = model.findAllCategories(rest.id)
                    ForEach(categories.indices, id: \.self) { index in
                        // MARK: category name
                        Text(categories[index].uppercased())
                            .bold()
                            .foregroundColor(.white)
                            .font(.title2)
                            .fixedSize(horizontal: false, vertical: true)
                            .padding()
                            .multilineTextAlignment(.center)
                            .background(ArrowShape()
                                .fill(Color("CategoryTitleBckColor"))
                                .shadow(radius: 10))
                            .padding(.top, index == 0 ? 30 : 40)


                        // MARK: food display following its category
                        LazyVStack(alignment: .leading, spacing: 17) {
                            ForEach(rest.foodList) { food in
                                FoodCardView(food: food)
                            }
                        }
                            .padding()

                    }

                }

            }
        }
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
