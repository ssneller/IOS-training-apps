//
//  ViewController.swift
//  SwiftMapProject
//
//  Created by Steve Sneller on 8/27/14.
//  Copyright (c) 2014 Steve Sneller. All rights reserved.
//

import UIKit


class ViewController: UIViewController { <CLLocationManagerDelegate, MKMapViewDelegate>
    
    var mapDelegate: MKMapViewDelegate
    var myMapView: MKMapView = MKMapView(frame: CGRectMake(0, 0, 320, 320),
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

