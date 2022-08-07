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
    @State private var opacity = 0.5

    // Customise your SplashScreen here
    var body: some View {
        if model.authorizationState == .notDetermined {
            LaunchContentView()
        }
        else if model.authorizationState == .authorizedAlways || model.authorizationState == .authorizedWhenInUse {

            HomeView()

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
