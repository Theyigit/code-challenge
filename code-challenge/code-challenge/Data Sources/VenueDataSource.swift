 //
//  VenueDataSource.swift
//  code-challenge
//
//  Created by Yigit Yilmaz on 19.07.2018.
//  Copyright © 2018 Yigit Yilmaz. All rights reserved.
//

import Foundation
import ObjectMapper
import Alamofire


class VenueDataSource {
    var responses : [Venue] = []

    func loadData(forCityName cityName: String,
                  successCallback: @escaping () -> (),
                  errorCallback: @escaping (_ error: String) -> ()
        ) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "requestStarted"), object: nil)
        FoursquareNetwork.request(target: .search(city: cityName), success: { (JSON) in

            let responses = Mapper<Venue>().mapArray(JSONArray: JSON["response"]["venues"].arrayObject as! [[String : Any]])
            self.responses = responses

            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "requestEnded"), object: nil)
            successCallback()
        }, error: { (errorString, statusCode) in
            print("\(errorString) - \(statusCode)")
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "requestEnded"), object: nil)
            errorCallback(errorString)
        }) { (error) in
            print(error.localizedDescription)
            errorCallback(error.localizedDescription)
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "requestEnded"), object: nil)
        }
    }

}
