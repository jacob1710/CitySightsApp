//
//  OnboardingView.swift
//  CitySightsApp
//
//  Created by Jacob Scase on 01/08/2021.
//

import SwiftUI

struct OnboardingView: View {
    @EnvironmentObject var contentModel: ContentModel
    
    @State private var tabSelection = 0
    private let blue = Color(red: 0/255, green: 130/255, blue: 167/255)
    private let teal = Color(red: 55/255, green: 197/255, blue: 192/255)
    
    var body: some View {
        VStack{
            TabView(selection: $tabSelection) {
                VStack(spacing: 20){
                    Image("city2")
                        .resizable()
                        .scaledToFit()
                    Text("Welcome to City Sights!")
                        .bold()
                        .font(.title)
                    Text("City Sights helps you find the best of the city!")
                }
                .multilineTextAlignment(.center)
                .padding()
                .foregroundColor(.white)
                .tag(0)
               
                
                
                VStack(spacing: 20){
                    Image("city1")
                        .resizable()
                        .scaledToFit()
                    Text("Ready to discover your city?")
                        .bold()
                        .font(.title)
                    Text("We'll show you the best restaurants, venues and more, based on your location!")
                        .multilineTextAlignment(.center)
                        
                }
                .multilineTextAlignment(.center)
                .padding()
                .foregroundColor(.white)
                .tag(1)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            Button {
                //Detect which tab
                if tabSelection == 0{
                    tabSelection = 1
                }else{
                    //TODO: Request for permission
                    contentModel.requestGeolocationPermission()
                }
                
            } label: {
                ZStack{
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(height: 48)
                        .cornerRadius(10)
                    Text(tabSelection == 0 ? "Next": "Get My Location")
                        .bold()
                        .padding()
                    
                    
                }
                .background(tabSelection == 0 ? blue:teal)
            }
            .padding()
            .accentColor(tabSelection == 0 ? blue:teal)

        }
        .background(tabSelection == 0 ? blue:teal)
        .ignoresSafeArea(.all,edges: .all)
    }
}

