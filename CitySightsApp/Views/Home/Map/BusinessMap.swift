//
//  BusinessMap.swift
//  CitySightsApp
//
//  Created by Jacob Scase on 28/07/2021.
//

import SwiftUI
import MapKit

struct BusinessMap: UIViewRepresentable {
    
    @EnvironmentObject var contentModel: ContentModel
    
    var locations:[MKPointAnnotation]{
        
        var annotations = [MKPointAnnotation]()
        
        
        
        for business in contentModel.restaurants + contentModel.sights{
            if let lat = business.coordinates?.latitude, let long = business.coordinates?.longitude{
                let annotation = MKPointAnnotation()
                annotation.coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
                annotation.title = business.name ?? ""
                annotations.append(annotation)
            }
            
        }
        return annotations
        
    }
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        
        //Make user show up on map
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .followWithHeading
                
        
        return mapView
        
    }
    func updateUIView(_ uiView: MKMapView, context: Context) {
        //Remove all annotations
        uiView.removeAnnotations(uiView.annotations)
        
        //Add ones based on business
        uiView.showAnnotations(self.locations, animated: true)
    }
    
    
    static func dismantleUIView(_ uiView: MKMapView, coordinator: ()) {
        uiView.removeAnnotations(uiView.annotations)
    }
}
