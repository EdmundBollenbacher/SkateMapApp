//
//  MapViewController.swift
//  NewSkateMapApp
//
//  Created by Edmund Bollenbacher on 2/12/18.
//  Copyright © 2018 Edmund Bollenbacher. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet var mapView: MKMapView!
    
    var spot = Spot()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.showsCompass = true

        // convert address to coordinate and annotate on map
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(spot.location, completionHandler: { placemarks, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            if let placemarks = placemarks {
                // first placemark
                let placemark = placemarks[0]
                
                // annotation
                let annotation = MKPointAnnotation()
                annotation.title = self.spot.name
                annotation.subtitle = self.spot.type
                
                if let location = placemark.location {
                    annotation.coordinate = location.coordinate
                    
                    // display annotation
                    self.mapView.showAnnotations([annotation], animated: true)
                    self.mapView.selectAnnotation(annotation, animated: true)
                }
            }
        })
        
        mapView.delegate = self

    }

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "MyMarker"
        
        if annotation.isKind(of: MKUserLocation.self) {
            return nil
        }
        
        // reuse the annotation if possible
        var annotationView: MKMarkerAnnotationView? = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView
        
        if annotationView == nil {
            annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
        }
        
        annotationView?.glyphImage = UIImage(named: "stairsWithRail")
        //annotationView?.glyphText = "spot"
        annotationView?.markerTintColor = #colorLiteral(red: 0.3945206678, green: 0.9255829632, blue: 0.632197635, alpha: 1)
        
        return annotationView
    }

}
