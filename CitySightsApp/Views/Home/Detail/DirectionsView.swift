//
//  DirectionsView.swift
//  CitySightsApp
//
//  Created by Jacob Scase on 29/07/2021.
//

import SwiftUI

struct DirectionsView: View {
    
    var business: Business
    var body: some View {
        VStack(alignment: .leading){
            
            //BUsiness title
            HStack{
                BusinessTitle(business: business)
                Spacer()
                if let lat = business.coordinates?.latitude, let long = business.coordinates?.longitude, let name = business.name{
                    Link("Open in Maps", destination: URL(string: "http://maps.apple.com/?ll=\(lat),\(long)&q=\(name.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)")!)
                        .padding()
                }
               
            }
            .padding()
           
            
            
            //Directions map
            DirectionsMap(business: business)
            
        }
        .ignoresSafeArea(.all, edges: .bottom)
    }
}
