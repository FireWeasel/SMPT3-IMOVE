//
//  ProfileViewController.swift
//  IMOVE3
//
//  Created by Fhict on 02/12/2017.
//  Copyright © 2017 fontys. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    //MARK: Properties
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var LevelLabel: UILabel!
    @IBOutlet weak var PointsLabel: UILabel!
    @IBOutlet weak var UserNameLabel: UILabel!
    var user = User(name: "John Peters", userID: 001, profileImage: UIImage(named: "ilS1ri2v")!, password: "1234")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LoadProfile()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: Functions
    func LoadProfile()
    {
        profileImage.image = user.profileImage
        UserNameLabel.text = user.name
        PointsLabel.text = String(user.totalScore)
        LevelLabel.text = String(user.level)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
