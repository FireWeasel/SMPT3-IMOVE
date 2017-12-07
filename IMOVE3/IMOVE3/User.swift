//
//  File.swift
//  IMOVE3
//
//  Created by Fhict on 02/12/2017.
//  Copyright © 2017 fontys. All rights reserved.
//

import Foundation
import UIKit

class User {
    var name:String!
    var password:String
    var userID:Int!
    var totalScore:Int!
    var level:Int!
    var profileImage:UIImage
    
    init(name: String, userID: Int, profileImage: UIImage, password: String ) {
        self.name = name
        self.userID = userID
        self.profileImage = profileImage
        self.password = password
        self.level = 1
        self.totalScore = 0
    }
}
