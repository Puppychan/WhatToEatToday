//
//  WhatToEatTodayApp.swift
//  WhatToEatToday
//
//  Created by Nhung Tran on 19/07/2022.
//

import SwiftUI

@main
struct WhatToEatTodayApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(RestaurantModel())
        }
    }
}
