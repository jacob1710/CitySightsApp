//
//  ContentView.swift
//  CitySightsApp
//
//  Created by Jacob Scase on 24/07/2021.
//

import SwiftUI
import CoreLocation

struct LaunchView: View {
    
    @EnvironmentObject var contentModel: ContentModel
    
    var body: some View {
        
        //Detect authorization status of locating the user
        
        if contentModel.authorizationState == .notDetermined{
            //If undetermined, show onboarding
        }else if contentModel.authorizationState == .authorizedAlways || contentModel.authorizationState == .authorizedWhenInUse{
            
            HomeView()
            
        }else{
            //Denied View
        }
        
        
        
        
        
     
    
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
