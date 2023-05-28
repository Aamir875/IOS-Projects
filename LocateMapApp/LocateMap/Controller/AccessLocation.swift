//
//  ViewController.swift
//  GettingLocationAndLocateOnMap
//
//  Created by Aamir khan on 05/04/23.
//

import UIKit
import MapKit
import CoreLocation

class AccessLocation : UIViewController, CLLocationManagerDelegate {

    @IBOutlet var mapView : MKMapView!
    
    static var latitude : Double = 0.0
    static var longitude : Double = 0.0
    var myLocation = CLLocation(latitude: latitude, longitude: longitude)
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        render(location:myLocation)
    }
    
    
    func render(location:CLLocation){
        let coordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        mapView.setRegion(region, animated: true)
        mapView.showsUserLocation = true
        let pin = MKPointAnnotation()
        pin.coordinate = coordinate
        mapView.addAnnotation(pin)
    }
}
