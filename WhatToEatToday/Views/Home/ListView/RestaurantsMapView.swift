//
//  MapView.swift
//  WhatToEatToday
//
//  Created by Nhung Tran on 02/08/2022.
//

import SwiftUI
import MapKit

struct RestaurantsMapView: View {
//    var places: [Restaurant]
    @EnvironmentObject var model: RestaurantModel
//    private let places = [
//        //2.
//        PointOfInterest(name: "Galeria Umberto I", latitude: 10.725159296481767, longitude:   106.71993771103867),
//        PointOfInterest(name: "Castel dell'Ovo", latitude: 10.78197620152864, longitude: 106.70476570852136),
//        PointOfInterest(name: "Piazza Dante", latitude: 10.752667582461726, longitude: 106.67376525521696)
//    ]
//    @State private var region = MKCoordinateRegion(
//        center: model.locationManager.location!.coordinate,
//        span: MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03)
//    )
    
    var body: some View {
//        Map(coordinateRegion: $region, showsUserLocation: true, annotationItems: places) { place in
//            MapAnnotation(coordinate: place.coordinateObject()) {
//                Image(systemName: "mappin.circle.fill")
//                                    .font(.title)
//                                    .foregroundColor(.blue)
//            }
//        }
//        .ignoresSafeArea(.all)
        Map(coordinateRegion: $model.region, showsUserLocation: true)
        .ignoresSafeArea(.all)
    }
//    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
//        region = MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.004, longitudeDelta: 0.005))
//    }
}
