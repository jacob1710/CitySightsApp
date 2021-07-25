//
//  BusinessList.swift
//  CitySightsApp
//
//  Created by Jacob Scase on 25/07/2021.
//

import SwiftUI

struct BusinessList: View {
    @EnvironmentObject var contentModel: ContentModel
    var body: some View {
        ScrollView{
            LazyVStack(alignment: .leading, pinnedViews:[.sectionHeaders]){
                BusinessSection(title: "Restaurants", businesses: contentModel.restaurants)
                BusinessSection(title: "Sights", businesses: contentModel.sights)
            }
        }
    }
}

