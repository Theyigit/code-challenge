//
//  FoursquareNetwork.swift
//  code-challenge
//
//  Created by Yigit Yilmaz on 19.07.2018.
//  Copyright © 2018 Yigit Yilmaz. All rights reserved.
//

import Moya
import SwiftyJSON

class FoursquareNetwork {
    @discardableResult static public func request(
        target: FourSquareAPIService,
        success successCallback: @escaping (JSON) -> Void,
        error errorCallback: @escaping (_ message : String, _ statusCode: Int) -> Void,
        failure failureCallback: @escaping (MoyaError) -> Void
        ) -> Cancellable {

        let pluginsArray:[PluginType] = [NetworkLoggerPlugin(cURL: true)]

        let provider = MoyaProvider<FourSquareAPIService>(plugins: pluginsArray)

        return provider.request(target) { result in
            switch result {
            case let .success(response):
                do {
                    _ = try response.filterSuccessfulStatusCodes()
                    let json = try JSON(response.mapJSON())
                    successCallback(json)
                }
                catch MoyaError.statusCode(let errorResponse) {
                    do {
                        let errorJSON = try JSON(response.mapJSON())
                        if let errorString = errorJSON["status"]["message"].string {
                            errorCallback(errorString, errorResponse.statusCode)
                        }
                        return
                    } catch {
                        errorCallback(errorResponse.description, errorResponse.statusCode)
                    }

                } catch MoyaError.underlying(let nsError, _) {
                    let error = nsError as NSError
                    errorCallback(error.localizedDescription, 0)
                } catch {
                    errorCallback("error", 0)

                }
            case let .failure(error):
                failureCallback(error)
            }
        }
    }
}

