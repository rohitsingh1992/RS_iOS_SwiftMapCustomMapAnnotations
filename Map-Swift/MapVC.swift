//
//  ViewController.swift
//  Map-Swift
//
//  Created by Rohit Singh on 17/01/15.
//  Copyright (c) 2015 Rohit Singh. All rights reserved.
//

import UIKit
import MapKit


protocol MapProtocol{

    func dataSend(#info:String);
}

class MapVC: MKMapView,MKMapViewDelegate {
    
    
    //Designanated Initializer of MapViewClass
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.delegate = self;
    }

    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    //Global Object Of Custom Annotaion Class
    var customAnnotation:CustomAnnotation?
    
   
    
    //Method for setting up the Location on map view
    func setUpArrayOfLocationsWithLocations(#array:[AnyObject]){
        
        for  dict in array
        {
            var loc:Dictionary = dict as Dictionary <String,CLLocationDegrees>
            print("location id \(loc)")
            
            
            var cord:CLLocationCoordinate2D = CLLocationCoordinate2DMake(loc["lat"]!, loc["long"]!)
            
            var rag:MKCoordinateRegion = MKCoordinateRegionMakeWithDistance(cord, 4000.0, 4000.0)
            
            
            var basic:BasicAnnotation = BasicAnnotation()
            basic.initWithLatitude(lat: loc["lat"]! , longitude: loc["long"]!)
            
            
            self.addAnnotation(basic
            )
            
        }
        
    }
    
    
    //MARK: --- Map View Delegate methods
    
    func mapView(mapView: MKMapView!, didSelectAnnotationView view: MKAnnotationView!) {
        
        if view.annotation is BasicAnnotation
        {
            
            
            if (customAnnotation?.coordinate.latitude == view.annotation.coordinate.latitude && customAnnotation?.coordinate.longitude == view.annotation.coordinate.longitude)
            {
                return
            }
            else{
                mapView.removeAnnotation(customAnnotation);
            }
            
            
            var custom:CustomAnnotation = CustomAnnotation()
            customAnnotation = custom.initWithLatitude(view.annotation.coordinate.latitude, long: view.annotation.coordinate.longitude)
            
            mapView.addAnnotation(customAnnotation)
            mapView.setCenterCoordinate(customAnnotation!.coordinate , animated: true)
        }
        else{
            //mapView.removeAnnotation(customAnnotation)
        }
        
        
    }
    
    func mapView(mapView: MKMapView!, didDeselectAnnotationView view: MKAnnotationView!)
    {
        
        if ((customAnnotation?.coordinate.latitude == view.annotation.coordinate.latitude && customAnnotation?.coordinate.longitude == view.annotation.coordinate.longitude))
        {
            mapView.removeAnnotation(customAnnotation)
            customAnnotation = nil;
        }
    }
    
    
    
    
    func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {
        
        if annotation is BasicAnnotation
        {
            var annotaionViewBasic:MKAnnotationView? = self.dequeueReusableAnnotationViewWithIdentifier("basic")
            
            if annotaionViewBasic == nil
            {
                
                annotaionViewBasic = MKAnnotationView(annotation: annotation, reuseIdentifier: "basic")
                annotaionViewBasic?.canShowCallout = false
                annotaionViewBasic?.image = UIImage(named: "pin.png")
            }
            
            return annotaionViewBasic
            
        }
        else if annotation is CustomAnnotation
        {
            
            var annotationView:CustomAnnotationView? = mapView .dequeueReusableAnnotationViewWithIdentifier("custom") as CustomAnnotationView?;
            
            if annotationView == nil
            {
                
                annotationView = CustomAnnotationView(annotation: annotation, reuseIdentifier: "custom") as CustomAnnotationView
                
                var callOutView:CallOutView = NSBundle.mainBundle().loadNibNamed("CallOutView", owner: self, options: nil)[0] as CallOutView
                
                var lbl:UILabel = callOutView.viewWithTag(100) as UILabel
                lbl.text = "Swift"
                
                var btn:UIButton = callOutView.viewWithTag(200) as UIButton
                btn.addTarget(self, action: "pressed:", forControlEvents: UIControlEvents.TouchUpInside)
                
                annotationView?.content.addSubview(callOutView)
                
            }
            return annotationView
            
        }
        
        return nil;
        
    }
    
    
    
    //Selector Method of Button Click
    func pressed(btn:UIButton){
        print("pressed");
    }
    
    
    
}

