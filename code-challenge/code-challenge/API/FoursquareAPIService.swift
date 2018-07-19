//
//  FoursquareAPIService.swift
//  code-challenge
//
//  Created by Yigit Yilmaz on 19.07.2018.
//  Copyright © 2018 Yigit Yilmaz. All rights reserved.
//

import Moya

enum FourSquareAPIService {
    case search(city: String?)
}

extension FourSquareAPIService: TargetType {
    var baseURL: URL { return URL(string: "https://api.foursquare.com/v2/venues")! }

    var path: String {
        switch self {
        case .search:
            return "search"
        }
    }

    var method: Method {
        switch self {
        case .search:
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
                "client_id": "C0RPQHVQIANMTPWBWDYNJFHO1SYEQDZ55H2IYSINQOCUSIRQ",
                "client_secret": "GAPU3A1L1IROOOW2E4VVSYDMJZZWARB1MDLX3D5QKA0EGRLO",
                "near": city ?? "İstanbul",
                "query": "coffee",
                "v": "20180719"
            ]
        }
    }


    var headers: [String : String]? {
        return nil
    }
}

