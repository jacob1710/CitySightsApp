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
    @Binding var selectedBusiness: Business?
    
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
        mapView.delegate = context.coordinator
        
        
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
    
    //MARK: Coordinator class
    func makeCoordinator() -> Coordinator {
        return Coordinator(map: self)
    }
    
    class Coordinator: NSObject, MKMapViewDelegate{
        
        var map: BusinessMap
        
        init(map: BusinessMap) {
            self.map = map
        }
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            
            if annotation is MKUserLocation{
                return nil
            }
            
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: Constants.annotationReuseID)
            
            if annotationView == nil{
                annotationView = MKMarkerAnnotationView(annotation:
                                                                annotation, reuseIdentifier: Constants.annotationReuseID)
                annotationView!.canShowCallout = true
                annotationView!.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            }else{
                annotationView!.annotation = annotation
            }
            
            //Annotation View
           
            return annotationView
        }
        func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
            
            //User tapped on annotation view
            for business in map.contentModel.restaurants + map.contentModel.sights{
                if business.name == view.annotation?.title{
                    map.selectedBusiness = business
                    return
                }
            }
            
           
        }
    }
}
