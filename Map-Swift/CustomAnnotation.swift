//
//  CutomAnnotation.swift
//  Map-Swift
//
//  Created by Rohit Singh on 18/01/15.
//  Copyright (c) 2015 Rohit Singh. All rights reserved.
//

import UIKit
import MapKit

class CustomAnnotation: NSObject,MKAnnotation {
 
    var latitude:CLLocationDegrees = 0.0;
    var logi:CLLocationDegrees = 0.0;
    
    func initWithLatitude(latitude:CLLocationDegrees,long:CLLocationDegrees)->CustomAnnotation
    {
        
        self.latitude = latitude
        self.logi = long
        
        return self;
        
    }
    
    var coordinate: CLLocationCoordinate2D
        {
            
            var cord:CLLocationCoordinate2D = CLLocationCoordinate2DMake(self.latitude, self.logi)
            return cord;
    }
    
    
    
    func setCoordinate(newCoordinate: CLLocationCoordinate2D) {
        
        self.latitude = newCoordinate.latitude
        self.logi = newCoordinate.longitude
    }
}
