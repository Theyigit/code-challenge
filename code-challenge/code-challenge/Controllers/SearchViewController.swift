//
//  SearchViewController.swift
//  code-challenge
//
//  Created by Yigit Yilmaz on 19.07.2018.
//  Copyright © 2018 Yigit Yilmaz. All rights reserved.
//

import Foundation
import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet var searchTextField: UITextField!

    @IBAction func search(_ sender: Any) {

        if (searchTextField.text?.isEmpty)! {
            makeRequestToApi(address: "istanbul")
        } else {
            makeRequestToApi(address: searchTextField.text!)
        }

    }

    private func makeRequestToApi(address: String) {

        FoursquareNetwork.request(target: .search(city: address), success: { (JSON) in

        }, error: { (errorString, statusCode) in
            print("\(errorString) - \(statusCode)")
            //errorCallback(errorString)
        }) { (error) in
            print(error.localizedDescription)
            //errorCallback(error.localizedDescription)
        }

    }

}
