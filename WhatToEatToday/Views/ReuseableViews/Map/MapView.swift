/*
    RMIT University Vietnam
    Course: COSC2659 iOS Development
    Semester: 2022B
    Assessment: Assignment 2
    Author: Tran Mai Nhung
    ID: s3879954
    Created  date: 26/07/2022
    Last modified: 07/08/2022
    Acknowledgement:
 - Canvas, CodeWithChris Course
 - https://codewithchris.com/swiftui/swiftui-corelocation/
*/


import SwiftUI
import MapKit

struct MapView: View {
    @EnvironmentObject private var model: RestaurantModel

    var body: some View {
        Map(coordinateRegion: $model.userLocation,
            interactionModes: MapInteractionModes.all,
            showsUserLocation: true,
            annotationItems: model.restaurants) { rest in
            MapAnnotation(coordinate: rest.coordinateObject(), content: {
                    MapAnnotationView(rest: rest, showMap: {
                        model.openAppleMap(endCoordinate: rest.coordinateObject())
                    })
                })
        }
            .ignoresSafeArea(.all)
            .toolbar(content: {
            HStack {
                ZStack {
                    Text("Restaurant Map View".uppercased())
                        .bold()
                        .foregroundColor(.white)
                        .font(.title3)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding()
                        .multilineTextAlignment(.center)
                        .background(ArrowShape()
                            .fill(Color("CategoryTitleBckColor"))
                            .shadow(radius: 10))
                        .background(ArrowShape()
                            .fill(Color("CategoryTitleBckColor"))
                            .rotation3DEffect(
                                Angle.degrees(180),
                                axis: (0,1,0),
                                perspective: 0.3
                            ))
                }
                Spacer()
            }
        })

    }
}

