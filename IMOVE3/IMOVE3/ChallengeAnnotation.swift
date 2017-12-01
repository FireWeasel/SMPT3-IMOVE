//
//  ChallengeAnnotation.swift
//  IMOVE3
//
//  Created by Fhict on 01/12/2017.
//  Copyright © 2017 fontys. All rights reserved.
//

import MapKit

class ChallengeAnnotation: NSObject, MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D
    var desc: String!
    var name: String!
    var image: String!
    
    init(coordinate: CLLocationCoordinate2D, image: String, desc:String, name:String) {
        self.coordinate = coordinate
        self.image = image
        self.desc = desc
        self.name = name
    }
}
