//
//  TheaterViewController.swift
//  MyMovieChart
//
//  Created by jwh on 2017. 1. 25..
//  Copyright © 2017년 jwh. All rights reserved.
//

import UIKit
import MapKit

class TheaterViewController : UIViewController{
    var param : NSDictionary!
    
    @IBOutlet var map: MKMapView!
    
    override func viewDidLoad() {
        self.navigationItem.title = self.param["상영관명"] as? String
        
        let lat = (param?["위도"] as! NSString).doubleValue
        let lng = (param?["경도"] as! NSString).doubleValue
        let location = CLLocationCoordinate2D(latitude: lat, longitude: lng)
        
        let regionRadius: CLLocationDistance = 100
        
       let coordinateRegion =  MKCoordinateRegionMakeWithDistance(location, regionRadius, regionRadius)
        
        self.map.setRegion(coordinateRegion,animated: true)
        
        
        //지도에표시
        let point = MKPointAnnotation()
        point.coordinate = location
        self.map.addAnnotation(point)
    }
}
