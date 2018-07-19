//
//  SearchTextField.swift
//  code-challenge
//
//  Created by Yigit Yilmaz on 19.07.2018.
//  Copyright © 2018 Yigit Yilmaz. All rights reserved.
//

import UIKit

@IBDesignable class SearchTextField: UITextField {

    required public init?(coder aDecoder: NSCoder) {

        super.init(coder: aDecoder)

        self.borderStyle = .roundedRect
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.gray.cgColor

    }

}
