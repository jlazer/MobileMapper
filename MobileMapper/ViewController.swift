//
//  ViewController.swift
//  MobileMapper
//
//  Created by student1 on 4/8/16.
//  Copyright © 2016 JohnHerseyHighSchool. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController,MKMapViewDelegate {
    
    @IBOutlet weak var myMapView: MKMapView!
    let ord = MKPointAnnotation()
    
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
        //let address2 = "Los Angeles"
        //let geoCoder2 = CLGeocoder()
        //geoCoder.geocodeAddressString(address2) { (arrayOfPlacemarks2, error) -> Void in
          //  for place2 in arrayOfPlacemarks2!
            //{
              //  let annotation2 = MKPointAnnotation()
                //annotation2.coordinate = (place2.location?.coordinate)!
                //annotation2.title = place2.name
                //self.myMapView.addAnnotation(annotation2)
            //}
            
        //}
        func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
            let pin = MKAnnotationView(annotation: annotation, reuseIdentifier:  nil)
            pin.image = UIImage(named: "mobilemakers")
            pin.canShowCallout = true
            let button = UIButton(type: .DetailDisclosure)
            pin.rightCalloutAccessoryView = button
            return pin
        }
}
}