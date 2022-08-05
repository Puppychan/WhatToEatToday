//
//  MapView.swift
//  WhatToEatToday
//
//  Created by Nhung Tran on 02/08/2022.
//
//https://codewithchris.com/swiftui/swiftui-corelocation/

import SwiftUI
import MapKit

struct MapView: View {
    @EnvironmentObject private var model: RestaurantModel

    // display all restaurants or 1 specific restaurant
    var isDisplayAll = true
    // if 1 specific restaurant
    var singleRestaurant: Restaurant?

    @State private var currentRest: Restaurant?


    var body: some View {
        Map(coordinateRegion: isDisplayAll ? $model.userLocation : .constant(model.createCoordinateRegion(singleRestaurant!.coordinateObject())) ,
            interactionModes: MapInteractionModes.all,
            showsUserLocation: true,
            annotationItems: isDisplayAll ? model.restaurants : [singleRestaurant!]) { rest in
            MapAnnotation(coordinate: rest.coordinateObject(), content: {
                    Button(action: {
                        currentRest = rest
//                        model.openAppleMap(endCoordinate: rest.coordinateObject())
                    }, label: {
                        MapAnnotation(rest: rest, showMap: {model.openAppleMap(endCoordinate: rest.coordinateObject())})
                        })
                        .buttonStyle(PlainButtonStyle())
                })
        }
            .ignoresSafeArea(.all)
            .preferredColorScheme(.dark)

    }
}
