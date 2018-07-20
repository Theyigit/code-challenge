//
//  SearchViewController.swift
//  code-challenge
//
//  Created by Yigit Yilmaz on 19.07.2018.
//  Copyright © 2018 Yigit Yilmaz. All rights reserved.
//

import Foundation
import UIKit
import RappleProgressHUD

class SearchViewController: UIViewController {

    let venueDataSource = VenueDataSource()
    
    @IBOutlet var searchTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        registerSpinnerStartObservable()
        registerSpinnerStopObservable()
    }

    @IBAction func search(_ sender: Any) {

        if (searchTextField.text?.isEmpty)! {
            makeRequestToAPI(address: "istanbul")
        } else {
            makeRequestToAPI(address: searchTextField.text!)
        }

    }

    private func makeRequestToAPI(address: String) {

        venueDataSource.loadData(forCityName: address, successCallback: {
            let venueViewController = self.storyboard?.instantiateViewController(withIdentifier: "VenueViewController") as! VenueViewController
            venueViewController.venues = self.venueDataSource.responses
            
            self.navigationController?.pushViewController(venueViewController, animated: true)

        }) { (errorString) in
            print(errorString)
        }

    }

}

extension SearchViewController: LoadingSpinnerObservable {

    func registerSpinnerStartObservable() {
        NotificationCenter.default.addObserver(self, selector: #selector(requestStarted), name: NSNotification.Name(rawValue: "requestStarted"), object: nil)
    }

    func registerSpinnerStopObservable() {
        NotificationCenter.default.addObserver(self, selector: #selector(requestEnded), name: NSNotification.Name(rawValue: "requestEnded"), object: nil)
    }

    @objc func requestStarted() {
        RappleActivityIndicatorView.startAnimating()
    }

    @objc func requestEnded() {
        RappleActivityIndicatorView.stopAnimation()
    }
}
