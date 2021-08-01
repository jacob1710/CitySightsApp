//
//  BusinessSectionHeader.swift
//  CitySightsApp
//
//  Created by Jacob Scase on 25/07/2021.
//

import SwiftUI

struct BusinessSectionHeader: View {
    
    var title: String
    
    var body: some View {
        ZStack(alignment: .leading){
            Rectangle()
                .foregroundColor(.white)
                .frame(height:48)
            Text(title)
                .font(.headline)
        }
        
    }
}

