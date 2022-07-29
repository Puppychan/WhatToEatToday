//
//  RestaurantMapView.swift
//  WhatToEatToday
//
//  Created by Nhung Tran on 29/07/2022.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    func updateUIView(_ uiView: MKMapView, context: Self.Context) {
        // update the element if needed
    }
    func makeUIView(context: Self.Context) -> MKMapView {
        // create and configuration UI element
        let mapView = MKMapView()
//        mapView.showsUserLocation = true
        return mapView
        
    }
}
struct RestaurantMapView : View {
    @EnvironmentObject var model: RestaurantModel
    var body: some View {
        MapView()
    }
}
struct RestaurantMapView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantMapView()
    }
}
