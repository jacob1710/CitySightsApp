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
            LazyVStack(alignment: .leading){
                ForEach(contentModel.restaurants) { business in
                    Text(business.name ?? "Business")
                    Divider()
                }
                ForEach(contentModel.sights) { business in
                    Text(business.name ?? "Business")
                    Divider()
                }
            }
        }
    }
}

struct BusinessList_Previews: PreviewProvider {
    static var previews: some View {
        BusinessList()
    }
}
