//
//  ContentModel.swift
//  CitySightsApp
//
//  Created by Jacob Scase on 24/07/2021.
//

import Foundation
import CoreLocation

class ContentModel: NSObject, CLLocationManagerDelegate, ObservableObject {
    
    var locationManager = CLLocationManager()
    
    
    override init() {
        super.init()
        
        locationManager.delegate = self
        
        locationManager.requestWhenInUseAuthorization()
        
        
//        locationManager.startUpdatingLocation()
        
        
    }
    
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if locationManager.authorizationStatus == CLAuthorizationStatus.authorizedAlways || locationManager.authorizationStatus == CLAuthorizationStatus.authorizedWhenInUse{
            
            print("Location Authorized")
            locationManager.startUpdatingLocation()

            
        }else{
            //No permission
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //Gives location of user
        print(locations.first ?? "No location provided")
        
        
        //Stop requestng location after get it once
        locationManager.stopUpdatingLocation()
    }
    
}
