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
                    // Image
                    Image("\(rest.name)-bck")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                    VStack(alignment: .leading, spacing: 10) {
                        // Restaurant Info
                        Text(rest.name)
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(Color("TitleRestaurantColor"))

                        HStack {
                            Image(systemName: "mappin.and.ellipse")
                                .foregroundStyle(Color("IconRestaurantColor"))
                                .symbolRenderingMode(.hierarchical)
                                .font(.headline)
                                .symbolVariant(.fill)
                            Text(rest.address)
                                .foregroundColor(Color("RestaurantAddressColor"))
                                .font(.body)
                        }
                        

                        Text(rest.description)
                            .lineSpacing(5)
                            .lineLimit(3)
                            .font(.callout)
                            .foregroundColor(Color("RestaurantDescriptionColor"))
                    }
                        .padding()
                }


                // MARK: - Food list with category
                LazyVStack(alignment: .leading) {
                    ForEach(rest.categories.indices, id: \.self) { index in
                        if (model.filterCategory(forId: rest.id, category: rest.categories[index]).count != 0) {
                            // MARK: category name
                            Text(rest.categories[index].uppercased())
                                .bold()
                                .foregroundColor(.white)
                                .font(.title2)
                                .fixedSize(horizontal: false, vertical: true)
                                .padding()
                                .multilineTextAlignment(.center)
                                .background(ArrowShape()
                                    .fill(Color("TitleCategoryBckColor"))
                                    .shadow(radius: 10))
                                .padding(.top, index == 0 ? 30 : 40)


                            // MARK: food display following its category
                            LazyVStack(alignment: .leading, spacing: 17) {
                                ForEach(model.filterCategory(forId: rest.id, category: rest.categories[index])) { food in
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
