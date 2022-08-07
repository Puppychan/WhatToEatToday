//
//  IngredientsView.swift
//  WhatToEatToday
//
//  Created by Nhung Tran on 07/08/2022.
//

import SwiftUI

struct IngredientsView: View {
    let descArr: [String]

    var body: some View {
        VStack(alignment: .leading) {
            ForEach(0..<descArr.count, id: \.self) { index in
                HStack {
                    Text("❃")
                        .font(.custom("Avenir", size: 20))
                    Text("\(descArr[index].capitalized)")
                        .font(.custom("Avenir", size: 17))
                }
            }
        }
    }
}

