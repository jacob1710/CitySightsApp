//
//  BusinessSearch.swift
//  CitySightsApp
//
//  Created by Jacob Scase on 24/07/2021.
//

import Foundation

struct BusinessSearch: Decodable {
    
    var businesses = [Business]()
    var total = 0
    var region = Region()
    
}
struct Region: Decodable {
    var center = Coordinate()
}
