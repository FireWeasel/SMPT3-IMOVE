//
//  LoginViewController.swift
//  IMOVE3
//
//  Created by Fhict on 07/12/2017.
//  Copyright © 2017 fontys. All rights reserved.
//

import UIKit
import FirebaseDatabase

class LoginViewController: UIViewController {
    var ref:DatabaseReference!
    var refHandler:UInt!
    var user: User!
    
    @IBOutlet weak var passTb: UITextField!
    @IBOutlet weak var nameTb: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
     
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func logIn(_ sender: Any) {
        let refHandle = ref.database.reference().child("Users").child(nameTb.text!)
        
        refHandle.updateChildValues(["loggedIn":true])
        
        refHandler = ref.child("Users").observe(.childChanged, with: { (snapshot) in
            
            if let dictionary = snapshot.value as? [String:AnyObject] {
                let name = dictionary["name"]
            }
            
        })
        
    }
    
}
