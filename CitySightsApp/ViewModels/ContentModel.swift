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
    
    @Published var restaurants = [Business]()
    @Published var sights = [Business]()
    
    
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
                        
            //Stop requestng location after get it once
            locationManager.stopUpdatingLocation()
            
            getBusinesses(category: Constants.sightsKey, location: userLocation!)
            getBusinesses(category: Constants.restaurantsKey, location: userLocation!)
        }
        
        
        
        
        
       
    }
    
    //MARK: Yelp API Methods
    
    func getBusinesses(category:String, location:CLLocation){
            

        var urlComponents = URLComponents(string: Constants.apiUrl)
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
            
            
            urlRequest.addValue("Bearer \(ApiKey.apiKey)", forHTTPHeaderField: "Authorization")
            
            let session = URLSession.shared
            
            let dataTask = session.dataTask(with: urlRequest) { data, response, error in
                if error == nil{
                    do{
                        let jsonDecoder = JSONDecoder()
                        let result = try jsonDecoder.decode(BusinessSearch.self, from: data!)
                        
                        DispatchQueue.main.async {
                            
                            switch category{
                            case Constants.sightsKey:
                                self.sights = result.businesses
                            case Constants.restaurantsKey:
                                self.restaurants = result.businesses
                            default:
                                break
                            }
                        }
                    }catch{
                        print("Error parsing json data",error)
                    }
                }else{
                    print("Error with getting data")
                }
            }
            
            dataTask.resume()
            
        }
        
    }
    
}
