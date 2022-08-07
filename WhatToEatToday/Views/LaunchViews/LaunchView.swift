/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2022B
 Assessment: Assignment 2
 Author: Tran Mai Nhung
 ID: s3879954
 Created  date: 19/07/2022
 Last modified: 07/08/2022
 Acknowledgement:
 - Canvas, CodeWithChris Course
 */

import SwiftUI

struct LaunchView: View {
    @EnvironmentObject var model: RestaurantModel
    
    // splashsreen here
    var body: some View {
        // if app has not ask user permission to access location
        if model.authorizationState == .notDetermined {
            LaunchContentView()
        }
        // user allow access to location
        else if model.authorizationState == .authorizedAlways || model.authorizationState == .authorizedWhenInUse {
            
            HomeView()
            
        }
        // user not allow -> open settings
        else {
            LaunchContentView(openSetting: true)
            
        }
        
    }
    
}
