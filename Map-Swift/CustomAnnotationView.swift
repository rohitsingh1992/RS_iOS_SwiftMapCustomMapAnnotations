//
//  CustomAnnotationView.swift
//  Map-Swift
//
//  Created by Rohit Singh on 18/01/15.
//  Copyright (c) 2015 Rohit Singh. All rights reserved.
//

import UIKit
import MapKit



class CustomAnnotationView: MKAnnotationView

{

    var content:UIView = UIView()
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    override init!(annotation: MKAnnotation!, reuseIdentifier: String!){
        
    
       super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
       // self.calloutOffset = CGPointMake(-60, -100)
        self.frame = CGRectMake(0, 0, self.frame.width, self.frame.height)
        var v:UIView =  UIView(frame: CGRectMake(-120,-90,self.frame.size.width,self.frame.size.height))
        
        self.addSubview(v)
        
        self.content = v
        self.canShowCallout = false;

        
    }

    
 override init(frame: CGRect)
 {
    super.init(frame: self.content.frame)
    
    }
    
    
    required init(coder aDecoder: NSCoder) {

        fatalError("init(coder:) has not been implemented")
    }
    
    
}
