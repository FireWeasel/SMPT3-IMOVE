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
    //var desc: String!
    //var name: String!
    //var image: UIImage!
    
    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
    }
}
