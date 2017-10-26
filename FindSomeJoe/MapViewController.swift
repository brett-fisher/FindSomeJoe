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

class MapViewController: UIViewController, CLLocationManagerDelegate {

  @IBOutlet weak var mapView: MKMapView!
  
  let manager = CLLocationManager()
  
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    
    let location = locations[0]
    
    let span = MKCoordinateSpanMake(0.01, 0.01)
    let myLocation = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
    let region = MKCoordinateRegionMake(myLocation, span)
    
    mapView.setRegion(region, animated: true)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    manager.delegate = self
    manager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
    manager.requestWhenInUseAuthorization()
    manager.startUpdatingLocation()
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }


}

