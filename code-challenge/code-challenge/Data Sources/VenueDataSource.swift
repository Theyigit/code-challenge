//
//  VenueDataSource.swift
//  code-challenge
//
//  Created by Yigit Yilmaz on 19.07.2018.
//  Copyright © 2018 Yigit Yilmaz. All rights reserved.
//

import Foundation
import ObjectMapper

class VenueDataSource {
    var responses : [Venue] = []

    func loadData(forCityName cityName: String,
                  successCallback: @escaping () -> (),
                  errorCallback: @escaping (_ error: String) -> ()
        ) {
        FoursquareNetwork.request(target: .search(city: cityName), success: { (JSON) in

            let responses = Mapper<Venue>().mapArray(JSONArray: JSON["response"]["venues"].arrayObject as! [[String : Any]])
            self.responses = responses
            
            successCallback()

        }, error: { (errorString, statusCode) in
            print("\(errorString) - \(statusCode)")
            errorCallback(errorString)
        }) { (error) in
            print(error.localizedDescription)
            errorCallback(error.localizedDescription)
        }
    }

    var numberOfSections: Int {
        return 1
    }

    var numberOfItems: Int {
        return responses.count
    }

    func media(atIndexPath indexPath: IndexPath) -> Venue {
        return responses[indexPath.row]
    }

}
