//
//  ViewController.swift
//  Map-Swift
//
//  Created by Rohit Singh on 17/01/15.
//  Copyright (c) 2015 Rohit Singh. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
    
    
    //Global Object Of |MapVC| Class
    var objMap:MapVC?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var dict1:Dictionary<String,CLLocationDegrees> = ["lat":18.18,"long":76.04];
        var dict2:Dictionary<String,CLLocationDegrees> = ["lat":24.68,"long":78.41];
        var dict3:Dictionary<String,CLLocationDegrees> = ["lat":21.17,"long":72.83];
        var dict4:Dictionary<String,CLLocationDegrees> = ["lat":30.37,"long":76.14];
        
        var array:Array = [AnyObject]()
        
        array.append(dict1)
        array.append(dict2)
        array.append(dict3)
        array.append(dict4)
        
        objMap = MapVC(frame: self.view.frame)
        self.view.addSubview(objMap!)
        objMap?.setUpArrayOfLocationsWithLocations(array: array)
    }
    
   
    
}

