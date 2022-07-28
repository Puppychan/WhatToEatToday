//
//  Shapes.swift
//  WhatToEatToday
//
//  Created by Nhung Tran on 28/07/2022.
//

import Foundation
import SwiftUI

struct ArrowShape: Shape {

    func path(in rect: CGRect) -> Path {
        let xArrowPoint = CGFloat(rect.maxX + (rect.maxX - rect.midX) / 3)
        let downArrowPoint = CGPoint(x: rect.maxX, y: rect.minY)
        let upArrowPoint = CGPoint(x: rect.maxX, y: rect.maxY)
        let middleArrowPoint = CGPoint(x: xArrowPoint, y: rect.midY)
        var path = Path()

        path.move(to: downArrowPoint)
        path.addLine(to: middleArrowPoint)
        path.addLine(to: upArrowPoint)
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: downArrowPoint)

        return path
    }
}
