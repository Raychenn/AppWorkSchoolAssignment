//
//  Station.swift
//  Week4-3
//
//  Created by Boray Chen on 2022/4/11.
//

import Foundation

struct Station: Codable {
    let id: String
    let name: String
    let address: String
    
   private enum CodingKeys: String, CodingKey {
        case id = "stationID"
        case name = "stationName"
        case address = "stationAddress"
    }
}


