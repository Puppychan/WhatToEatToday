//
//  LaunchView.swift
//  WhatToEatToday
//
//  Created by Nhung Tran on 29/07/2022.
//

import SwiftUI

struct LaunchView: View {
    @EnvironmentObject var model: RestaurantModel
    @State private var opacity = 0.5

    // Customise your SplashScreen here
    var body: some View {
        if model.authorizationState == .notDetermined {
            LaunchContentView()
        }
        else if model.authorizationState == .authorizedAlways || model.authorizationState == .authorizedWhenInUse {

//            HomeView()
//            RestaurantsMapView(places: model.restaurants)
            RestaurantsMapView()

        }
        else {
            LaunchContentView(openSetting: true)
            
        }

    }
    
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
