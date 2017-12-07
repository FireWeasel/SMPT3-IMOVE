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
    
    let storyBoard = UIStoryboard(name: "Main", bundle: nil)
    
    @IBAction func ClickStart(_ sender: Any) {
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "Challenge") as! UITabBarController
       
    UIApplication.topViewController()?.present(nextViewController, animated: true, completion: nil)

    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

extension UIApplication {
    class func topViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return topViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(base: selected)
            }
        }
        if let presented = base?.presentedViewController {
            return topViewController(base: presented)
        }
        return base
    }
}
