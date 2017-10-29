//
//  ViewController.swift
//  FindSomeJoe
//
//  Created by Brett Fisher on 10/25/17.
//  Copyright © 2017 Brett Fisher. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {

  var manager: CLLocationManager?
  
  @IBOutlet weak var mapView: MKMapView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    manager = CLLocationManager()
    manager?.delegate = self
    manager?.desiredAccuracy = kCLLocationAccuracyBest
    manager?.requestWhenInUseAuthorization()
    
  }
}

extension MapViewController: CLLocationManagerDelegate {
  
  // Only start updating the location after the user has authorized
  func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
    if status == .authorizedWhenInUse || status == .authorizedAlways {
      manager.requestLocation()
    }
  }
  
}

