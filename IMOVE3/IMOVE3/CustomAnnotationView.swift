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
    @IBOutlet weak var toughnessLabel: UILabel!
    
    
    
    var challengeObjec:ChallengeAnnotation!
    
    
    let storyBoard = UIStoryboard(name: "Main", bundle: nil)
    
    @IBAction func ClickStart(_ sender: Any) {
        print(self.challengeObjec.type)
        if(challengeObjec.type!.rawValue == "button"){
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "pushup") as! PushUpViewController
            nextViewController.challenge = self.challengeObjec
            UIApplication.topViewController()?.present(nextViewController, animated: true, completion: nil)
        }
        else if(challengeObjec.type!.rawValue == "map")
        {
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "cycle") as! CycleViewController
            nextViewController.challenge = self.challengeObjec
            UIApplication.topViewController()?.present(nextViewController, animated: true, completion: nil)
        }
        else if(challengeObjec.type!.rawValue == "group")
        {
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "group") as! GroupViewController
            nextViewController.challenge = self.challengeObjec
            UIApplication.topViewController()?.present(nextViewController, animated: true, completion: nil)
        }
        else if(challengeObjec.type!.rawValue == "climb")
        {
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "climbing") as! ClimbViewController
            nextViewController.challenge = self.challengeObjec
            UIApplication.topViewController()?.present(nextViewController, animated: true, completion: nil)
        }
        /*if(challengeName.text == "Push-up challenge")
        {
            
        }
        else if(challengeName.text == "Sit-up challenge")
        {
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "situp")
            UIApplication.topViewController()?.present(nextViewController, animated: true, completion: nil)
        }
        
        */

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
