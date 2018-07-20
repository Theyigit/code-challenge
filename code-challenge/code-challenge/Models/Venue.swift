//
//  Venue.swift
//  code-challenge
//
//  Created by Yigit Yilmaz on 19.07.2018.
//  Copyright © 2018 Yigit Yilmaz. All rights reserved.
//

import Foundation
import ObjectMapper


class Venue: Mappable{
    var id: String!
    var name: String!
    var address: String!
    var latitude: Double!
    var longtitude: Double!

    required init?(map: Map) {

    }

    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        address <- map["location.address"]
        latitude <- map["location.lat"]
        longtitude <- map["location.lng"]
    }

}

