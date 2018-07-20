//
//  VenuesViewController.swift
//  code-challenge
//
//  Created by Yigit Yilmaz on 19.07.2018.
//  Copyright © 2018 Yigit Yilmaz. All rights reserved.
//

import Foundation
import UIKit

class VenueViewController: UIViewController {

    var venues: [Venue] = []

    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 88
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
        
    }

}

// MARK: - UITableViewDataSource

extension VenueViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return venues.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: VenueCell.self)) as! VenueCell
        let venue = venues[indexPath.row]
        cell.name = venue.name
        cell.address = venue.address
        return cell
    }
}

// MARK: - UITableViewDelegate

extension VenueViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let popOverVC = self.storyboard?.instantiateViewController(withIdentifier: "PopupViewController") as! PopupViewController
        popOverVC.latitude = venues[indexPath.row].latitude
        popOverVC.longtitude = venues[indexPath.row].longtitude
        self.addChildViewController(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParentViewController: self)
        
    }
}
