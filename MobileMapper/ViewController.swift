//
//  ViewController.swift
//  MobileMapper
//
//  Created by student1 on 4/8/16.
//  Copyright © 2016 JohnHerseyHighSchool. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var myMapView: MKMapView!
    let ord = MKPointAnnotation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let latitude = 41.9742
        let longitude = -87.9073
        let coordinate = CLLocationCoordinate2DMake(latitude, longitude)
        
        ord.coordinate = coordinate
        ord.title = "O'Hare Airport"
        myMapView.addAnnotation(ord)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

