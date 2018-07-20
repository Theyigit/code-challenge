//
//  LoadingSpinnerObservable.swift
//  code-challenge
//
//  Created by Yigit Yilmaz on 19.07.2018.
//  Copyright © 2018 Yigit Yilmaz. All rights reserved.
//

import Foundation

protocol LoadingSpinnerObservable {

    func registerSpinnerStartObservable()

    func registerSpinnerStopObservable()

    func requestStarted()

    func requestEnded()

}
