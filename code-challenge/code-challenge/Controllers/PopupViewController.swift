//
//  PopupViewController.swift
//  code-challenge
//
//  Created by Yigit Yilmaz on 20.07.2018.
//  Copyright © 2018 Yigit Yilmaz. All rights reserved.
//

import UIKit
import MapKit

class PopupViewController: UIViewController {

    @IBOutlet var mapView: MKMapView!

    var latitude: Double?
    var longtitude: Double?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)

        showAnimate()
        loadMapView(lat: latitude!, lng:  longtitude!)

        let gestureRecognizer = UITapGestureRecognizer(target: self,action: #selector(removeAnimate))
        gestureRecognizer.cancelsTouchesInView = false
        gestureRecognizer.delegate = self
        self.view.addGestureRecognizer(gestureRecognizer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func showAnimate()
    {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0;
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        });
    }

    @objc func removeAnimate()
    {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0;
        }, completion:{(finished : Bool)  in
            if (finished)
            {
                self.view.removeFromSuperview()
            }
        });
    }

    func loadMapView(lat: Double, lng: Double) {

        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: lat, longitude: lng)
        mapView.addAnnotation(annotation)

        var region = MKCoordinateRegion()
        var span = MKCoordinateSpan()
        span.latitudeDelta = 0.01
        span.longitudeDelta = 0.01
        region.span = span
        region.center = annotation.coordinate
        self.mapView.setRegion(region, animated: true)
        self.mapView.regionThatFits(region)

    }

}

extension PopupViewController: UIGestureRecognizerDelegate {

    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer,
                           shouldReceive touch: UITouch) -> Bool {
        return (touch.view === self.view)
    }
}
