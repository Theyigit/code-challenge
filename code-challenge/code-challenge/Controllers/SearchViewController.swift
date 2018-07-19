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

    let venueDataSource = VenueDataSource()
    
    @IBOutlet var searchTextField: UITextField!

    @IBAction func search(_ sender: Any) {

        if (searchTextField.text?.isEmpty)! {
            makeRequestToAPI(address: "istanbul")
        } else {
            makeRequestToAPI(address: searchTextField.text!)
        }

    }

    private func makeRequestToAPI(address: String) {

        venueDataSource.loadData(forCityName: address, successCallback: {

        }) { (errorString) in
            print(errorString)
        }

    }

}
