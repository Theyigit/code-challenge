//
//  VenueCell.swift
//  code-challenge
//
//  Created by Yigit Yilmaz on 19.07.2018.
//  Copyright © 2018 Yigit Yilmaz. All rights reserved.
//

import Foundation
import UIKit

class VenueCell: UITableViewCell {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var addressLabel: UILabel!
    @IBOutlet var rateLabel: UILabel!

    var name: String? {
        didSet {
            self.nameLabel.text = name
        }
    }

    var address: String? {
        didSet {
            self.addressLabel.text = address
        }
    }

    var rate: String? {
        didSet {
            self.rateLabel.text = rate
        }
    }
}
