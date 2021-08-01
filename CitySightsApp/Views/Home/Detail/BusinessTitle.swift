//
//  BusinessTitle.swift
//  CitySightsApp
//
//  Created by Jacob Scase on 29/07/2021.
//

import SwiftUI

struct BusinessTitle: View {
    var business: Business
    var body: some View {
        
        VStack(alignment: .leading){
            
       
        //Name
        Text(business.name!)
            .font(.title2)
            .bold()
            
        
        
        //address
        if business.location?.displayAddress !=  nil{
            ForEach(business.location!.displayAddress!, id: \.self) { addressLine in
                Text(addressLine)
                    
            }
        }
        
        //rating
        Image("regular_\(business.rating ?? 0)")
            
        }
    }
}

