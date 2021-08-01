//
//  LocationDeniedView.swift
//  CitySightsApp
//
//  Created by Jacob Scase on 01/08/2021.
//

import SwiftUI

struct LocationDeniedView: View {
    let backgroundColor = Color(red: 34/255, green: 141/255, blue: 138/255)
    var body: some View {
        VStack(spacing: 20){
            Spacer()
            Text("Whoops!")
                .font(.title)
            Text("Please allow access to your location in settings.")
            Spacer()
            Button {
                //Open settings
                if let url = URL(string: UIApplication.openSettingsURLString){
                    UIApplication.shared.open(url)
                }
                
              
            } label: {
                ZStack{
                    Rectangle()
                        .cornerRadius(10)
                        .frame(height:48)
                        .foregroundColor(.white)
                    Text("Go To Settings")
                        .bold()
                        .foregroundColor(backgroundColor)
                        .padding()
                }
               
            }
            Spacer()

        }
        .padding()
        .foregroundColor(.white)
        .multilineTextAlignment(.center)
        .background(backgroundColor)
        .ignoresSafeArea(.all, edges: .all)
       
    }
}

struct LocationDeniedView_Previews: PreviewProvider {
    static var previews: some View {
        LocationDeniedView()
    }
}
