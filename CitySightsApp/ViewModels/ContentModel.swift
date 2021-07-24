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
        let userLocation = locations.first
        if userLocation != nil{
            //Have a location
            
            print(locations.first ?? "No location provided")
            
            //Stop requestng location after get it once
            locationManager.stopUpdatingLocation()
            
            getBusinesses(category: "arts", location: userLocation!)
//            getBusinesses(category: "restaurants", location: userLocation!)
        }
        
        
        
        
        
       
    }
    
    //MARK: Yelp API Methods
    
    func getBusinesses(category:String, location:CLLocation){
        
        let baseURL = "https://api.yelp.com/v3/businesses/search?"
        
        
        
        var urlComponents = URLComponents(string: baseURL)
        urlComponents?.queryItems = [
            URLQueryItem(name: "latitude", value: String(location.coordinate.latitude)),
            URLQueryItem(name: "longitude", value: String(location.coordinate.longitude)),
            URLQueryItem(name: "category", value: category),
            URLQueryItem(name: "limit", value: "6"),

        ]
            
        
        var url = urlComponents?.url
        
        if let url = url{
            //Could create url Object
            
            var urlRequest = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10.0)
            
            urlRequest.httpMethod = "GET"
            
            urlRequest.addValue("Bearer ", forHTTPHeaderField: "Authorization")
            
            let session = URLSession.shared
            
            let dataTask = session.dataTask(with: urlRequest) { data, response, error in
                if error == nil{
                    print(response)
                }else{
                    print("Error with getting data")
                }
            }
            
            dataTask.resume()
            
        }
        
    }
    
}
