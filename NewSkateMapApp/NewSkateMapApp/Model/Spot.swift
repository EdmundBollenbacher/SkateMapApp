//
//  Spot.swift
//  NewSkateMapApp
//
//  Created by Edmund Bollenbacher on 2/12/18.
//  Copyright © 2018 Edmund Bollenbacher. All rights reserved.
//

import Foundation

class Spot {
    var name: String
    var type: String
    var location: String
    var description: String
    var image: String
    var bust: String
    
    init(name: String, type: String, location: String, description: String, image: String, bust: String) {
        self.name = name
        self.type = type
        self.location = location
        self.description = description
        self.image = image
        self.bust = bust
    }
    
    convenience init() {
        self.init(name: "", type: "", location: "", description: "", image: "", bust: "")
    }
    
}
