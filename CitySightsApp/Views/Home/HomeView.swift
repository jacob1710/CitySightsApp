//
//  HomeView.swift
//  CitySightsApp
//
//  Created by Jacob Scase on 25/07/2021.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var contentModel: ContentModel
    @State var isMapShowing = false
    var body: some View {
        if contentModel.restaurants.count != 0 || contentModel.sights.count != 0{
            
            NavigationView{
                
                if !isMapShowing{
                    //Show List
                    VStack(alignment: .leading){
                        HStack{
                            Image(systemName: "location.circle.fill")
                            Text("San Francisco")
                            Spacer()
                            Text("Switch to map View")
                                .foregroundColor(.blue)
                        }
                        Divider()
                        BusinessList()
                        
                        
                    }
                    .padding([.horizontal,.top])
                    .navigationBarHidden(true)
                }else{
                    //Show Map
                }
            }
           
            
        }else{
            ProgressView()
        }
        
    }
}
