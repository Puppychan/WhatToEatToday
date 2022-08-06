//
//  UltilityModel.swift
//  WhatToEatToday
//
//  Created by Nhung Tran on 05/08/2022.
//

import Foundation
import MapKit

struct UltilityModel {
    // MARK: - Map
    // Create region object
    static func createCoordinateRegion(_ coordinate: CLLocationCoordinate2D) -> MKCoordinateRegion {
        return MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
        )
    }

    // Convert coordinate to string to show routes for user
    static func convertCoordinateString(_ coordinate: CLLocationCoordinate2D) -> String {
        return "\(String(format: "%f", coordinate.latitude)),\(String(format: "%f", coordinate.longitude))"
//        return "\(coordinate.latitude.description),\(coordinate.latitude.description)"
    }

    // MARK: - String
    static func splitStringComma(_ str: String) -> [String] {
        return str.components(separatedBy: ", ")
    }
}
