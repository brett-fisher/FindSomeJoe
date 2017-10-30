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
  var startLocation: CLLocation?
  
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
  
  func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {}
  
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    if startLocation == nil {
      startLocation = locations.first
      print(startLocation!)
      // Still need to update the map with location coordinates
    }
  }
  
  func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
    if status == .authorizedAlways || status == .authorizedWhenInUse {
      manager.requestLocation()
    }
  }
  
}

