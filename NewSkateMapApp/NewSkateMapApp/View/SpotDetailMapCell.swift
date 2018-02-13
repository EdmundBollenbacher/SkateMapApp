//
//  SpotDetailMapCell.swift
//  NewSkateMapApp
//
//  Created by Edmund Bollenbacher on 2/12/18.
//  Copyright © 2018 Edmund Bollenbacher. All rights reserved.
//

import UIKit
import MapKit

class SpotDetailMapCell: UITableViewCell {
    
    @IBOutlet var mapView: MKMapView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(location: String) {
        // get location
        let geoCoder = CLGeocoder()
        
        print(location)
        geoCoder.geocodeAddressString(location, completionHandler: { placemarks, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            if let placemarks = placemarks {
                // get the first placemark
                let placemark = placemarks[0]
                
                // add annotation
                let annotation = MKPointAnnotation()
                
                if let location = placemark.location {
                    // display the annotation
                    annotation.coordinate = location.coordinate
                    self.mapView.addAnnotation(annotation)
                    
                    // set zoom level
                    let region = MKCoordinateRegionMakeWithDistance(annotation.coordinate, 250, 250)
                    self.mapView.setRegion(region, animated: false)
                }
            }
        })
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
