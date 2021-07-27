//
//  BusinessRow.swift
//  CitySightsApp
//
//  Created by Jacob Scase on 27/07/2021.
//

import SwiftUI

struct BusinessRow: View {
    
    var business: Business
    
    var body: some View {
        VStack(alignment:.leading){
            HStack{
                
                VStack(alignment:.leading){
                    Text(business.name ?? "")
                    Text(String(business.distance ?? 0))
                }
                Spacer()
                
                //Star rating and reviews
                VStack(alignment:.leading){
                    Image("regular_/\(String(business.rating ?? 0))")
                }
            }
            Divider()
        }
    }
}
