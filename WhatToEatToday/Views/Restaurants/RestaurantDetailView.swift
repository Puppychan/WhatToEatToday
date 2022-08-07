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
 - https://stackoverflow.com/questions/59158476/how-to-have-text-in-shapes-in-swiftui
 - https://blckbirds.com/post/stretchy-header-and-parallax-scrolling-in-swiftui/
 - https://stackoverflow.com/questions/57582653/how-to-create-tappable-url-phone-number-in-swiftui
 */

import SwiftUI

struct RestaurantDetailView: View {
    
    var rest: Restaurant
    @State var imageHeight: CGFloat = 0
    @State var imageScale = 1.0 // for changing cover image when scrolling
    @State var showFullText = false // for expanding description of restaurant
    @EnvironmentObject var model: RestaurantModel
    var body: some View {
        ScrollView {
            // add display gone or not gone
            LazyVStack(alignment: .leading, spacing: 0) {
                
                // MARK: - Restaurant Info
                VStack {
                    // MARK: restaurant cover image
                    // for adding effect to the image
                    GeometryReader { geo in
                        ZStack(alignment: .center) {
                            
                            if geo.frame(in: .global).minY <= 0 {
                                // scroll down outside the screen -> move image up
                                ZStack {
                                    Image("\(rest.name)-bck")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                    
                                    ImageShadowView(opacity: 0.6)
                                }
                                .offset(y: geo.frame(in: .global).minY / 9) // move image up
                                .clipped()
                                
                            }
                            else {
                                // scroll up -> increase image size + move image down
                                ZStack {
                                    Image("\(rest.name)-bck")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                    ImageShadowView(opacity: 0.6)
                                }
                                .scaleEffect(1 + geo.frame(in: .global).minY / 500) // change scale of image
                                .clipped()
                                .offset(y: -geo.frame(in: .global).minY) // move image down
                                .animation(.easeInOut.delay(2), value: imageScale)
                                .background(Color("RestDetailImageBckColor").opacity(0.4))
                            }
                        }
                        // for fixing the text stand on the image bug
                        .frame(height: 600, alignment: .center)
                        .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.1), radius: 5, x: 3, y: 3)
                        
                    }
                    .frame(height: 603, alignment: .center)
                    
                    
                    
                    VStack(alignment: .leading, spacing: 13) {
                        // MARK: restaurant name
                        Text(rest.name)
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(Color("RestDetailTitleColor"))
                        
                        
                        // MARK: open hour and phone
                        Button(action: {
                            // if have phone -> call action
                            if rest.tel != "" {
                                let formattedString = "tel://" + rest.tel.replacingOccurrences(of: " ", with: "-")
                                guard let url = URL(string: formattedString) else { return }
                                UIApplication.shared.open(url)
                            }
                        }) {
                            HStack {
                                // if have phone number -> display call
                                if (rest.tel != "") {
                                    Image(systemName: "phone.fill")
                                        .foregroundColor(Color("RestDetailIconColor"))
                                }
                                // if not have phone number -> display hour
                                else {
                                    Image(systemName: "clock.badge.checkmark")
                                        .foregroundColor(Color("RestDetailIconColor"))
                                }
                                // open hour
                                Text(rest.openHour)
                                    .foregroundColor(Color("RestDetailAddColor"))
                                    .font(.headline)
                                    .lineLimit(1)
                                
                            }
                        }
                        
                        // MARK: restaurant address -> display map
                        HStack(spacing: 3) {
                            Button(action: {
                                model.openAppleMap(endCoordinate: rest.coordinateObject())
                            }, label: {
                                HStack {
                                    Image(systemName: "mappin.and.ellipse")
                                        .foregroundStyle(Color("RestDetailIconColor"))
                                        .symbolRenderingMode(.hierarchical)
                                        .font(.title3)
                                    Text(rest.address)
                                        .foregroundColor(Color("RestDetailAddColor"))
                                        .font(.headline)
                                        .lineLimit(1)
                                }
                            })
                            
                            Spacer()
                            
                            // MARK: restaurant rating
                            RatingView(rest: rest, fontSize: .title3)
                        }
                        
                        
                        // MARK: restaurant description
                        // need add read more
                        Text(rest.description)
                            .lineSpacing(5)
                            .lineLimit(showFullText ? nil : 2)
                            .font(.body)
                            .foregroundColor(Color("RestDetailDescColor"))
                            .onTapGesture(perform: { showFullText.toggle() })
                    }
                    .padding()
                }
                
                
                // MARK: - Food list with category
                FoodListView(rest: rest)
                    .padding(.bottom)
                
                
            }
        }
        .ignoresSafeArea()
    }
}
