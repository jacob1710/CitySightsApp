//
//  BusinessRow.swift
//  CitySightsApp
//
//  Created by Jacob Scase on 27/07/2021.
//

import SwiftUI

struct BusinessRow: View {
    
    @ObservedObject var business: Business
    
    var body: some View {
        VStack(alignment:.leading){
            HStack{
                let uiImage = UIImage(data: business.imageData ?? Data())
                Image(uiImage: uiImage ?? UIImage())
                    .resizable()
                    .frame(width: 50, height: 50, alignment: .center)
                    .cornerRadius(5)
                    .scaledToFit()
               
                
                VStack(alignment:.leading){
                    Text(business.name ?? "")
                        .bold()
                    Text(String(format:"%.1f KM away", (business.distance ?? 0)/1000))
                        .font(.caption)
                    
                }
                Spacer()
                
                //Star rating and reviews
                VStack(alignment:.leading){
                    Image("regular_\(String(business.rating ?? 0))")
                    Text("\(business.reviewCount ?? 0) Reviews")
                        .font(.caption)
                }
            }
            Divider()
        }
        .foregroundColor(.black)
    }
}
