//
//  BusinessSection.swift
//  CitySightsApp
//
//  Created by Jacob Scase on 25/07/2021.
//

import SwiftUI

struct BusinessSection: View {
    var title: String
    var businesses: [Business]
    var body: some View {
        Section(header:  BusinessSectionHeader(title: title)){
            ForEach(businesses) { business in
                NavigationLink(
                    destination: BusinessDetail(business: business),
                    label: {
                        BusinessRow(business: business)
                    })
                    
                
            }
        }
    }
}
