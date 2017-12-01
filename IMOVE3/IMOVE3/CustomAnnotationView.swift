//
//  CustomAnnotationView.swift
//  IMOVE3
//
//  Created by Fhict on 01/12/2017.
//  Copyright © 2017 fontys. All rights reserved.
//

import UIKit

class CustomAnnotationView: UIView {
    @IBOutlet weak var challengeImage: UIImageView!
    @IBOutlet weak var challengeName: UILabel!
    @IBOutlet weak var challengeDescription: UILabel!
    @IBOutlet weak var navigateButton: UIButton!
    
    @IBAction func ClickStart(_ sender: Any) {
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
