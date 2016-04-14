//
//  ViewController.swift
//  MobileMapper
//
//  Created by student1 on 4/8/16.
//  Copyright © 2016 JohnHerseyHighSchool. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController,MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var myMapView: MKMapView!
    let ord = MKPointAnnotation()
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myMapView.delegate = self
        let latitude = 41.9742
        let longitude = -87.9073
        let coordinate = CLLocationCoordinate2DMake(latitude, longitude)
        
        ord.coordinate = coordinate
        ord.title = "O'Hare Airport"
        myMapView.addAnnotation(ord)
        let address = "Mount Rushmore"
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(address) { (arrayOfPlacemarks, error) -> Void in
            for place in arrayOfPlacemarks!
            {
                let annotation = MKPointAnnotation()
                annotation.coordinate = (place.location?.coordinate)!
                annotation.title = place.name
                self.myMapView.addAnnotation(annotation)
            }
        }
        
        locationManager = CLLocationManager()
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        
    }
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last
        let center = CLLocationCoordinate2DMake(location!.coordinate.latitude, location!.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        self.myMapView.setRegion(region, animated: true)
        
    }
    
    
        func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
            let pin = MKAnnotationView(annotation: annotation, reuseIdentifier:  nil)
            pin.image = UIImage(named: "mobilemakers")
            pin.canShowCallout = true
            let button = UIButton(type: .DetailDisclosure)
            pin.rightCalloutAccessoryView = button
            return pin
        }
    func mapView(mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        let coordinateSpan = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let center = view.annotation!.coordinate
        let region = MKCoordinateRegion(center: center, span: coordinateSpan)
        myMapView.setRegion(region, animated: true)
        
    }
    
    }