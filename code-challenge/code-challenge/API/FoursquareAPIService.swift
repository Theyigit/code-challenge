//
//  FoursquareAPIService.swift
//  code-challenge
//
//  Created by Yigit Yilmaz on 19.07.2018.
//  Copyright © 2018 Yigit Yilmaz. All rights reserved.
//

import Moya

enum FourSquareAPIService {
    case search(city: String)
    case detail(venueID: String)
}

extension FourSquareAPIService: TargetType {
    var baseURL: URL { return URL(string: "https://api.foursquare.com/v2")! }

    var path: String {
        switch self {
        case .search:
            return "/venues/search"
        case .detail(let venueID):
            return "/venues/\(venueID)"
        }
    }

    var method: Method {
        switch self {
        case .search, .detail:
            return .get
        }
    }

    var sampleData: Data {
        return Data(base64Encoded: "")!
    }

    var task: Task {
        return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
    }

    var parameters: [String : Any] {
        switch self {

        case .search(let city):
            return [
                "client_id": "KOUQBQZK4JTV1M3ZWKYUG33JKFPTLPZC001WPILQQVAXKJHJ",
                "client_secret": "BZFPVI3JZGW1RZYWMN55LTUOI3AGYWAR2VMIWPDGWBIQO2JC",
                "near": city,
                "query": "coffee",
                "v": "20180719"
            ]

        case .detail(let venueID):
            return [
                "client_id": "KOUQBQZK4JTV1M3ZWKYUG33JKFPTLPZC001WPILQQVAXKJHJ",
                "client_secret": "BZFPVI3JZGW1RZYWMN55LTUOI3AGYWAR2VMIWPDGWBIQO2JC",
                "v": "20180719"
            ]
        }
    }

    var headers: [String : String]? {
        return nil
    }
}

