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
    manager?.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
    manager?.requestWhenInUseAuthorization()
    
  }
}

extension MapViewController: CLLocationManagerDelegate {
  
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    
    let location = locations[0]
    
    let span = MKCoordinateSpanMake(0.01, 0.01)
    let myLocation = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
    let region = MKCoordinateRegionMake(myLocation, span)
    
    mapView.setRegion(region, animated: true)
  }
  
  // Only start updating the location after the user has authorized
  func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
    if status == .authorizedWhenInUse || status == .authorizedAlways {
      manager.startUpdatingLocation()
    }
  }
  
}

