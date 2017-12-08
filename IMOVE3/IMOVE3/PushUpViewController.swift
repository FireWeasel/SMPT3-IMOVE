//
//  PushUpViewController.swift
//  IMOVE3
//
//  Created by Fhict on 08/12/2017.
//  Copyright © 2017 fontys. All rights reserved.
//

import UIKit

class PushUpViewController: UIViewController {

    @IBOutlet weak var UICountButton: UIButton!
    
    @IBOutlet weak var ExerciseButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ExerciseButton.layer.cornerRadius = 10
        ExerciseButton.clipsToBounds = true
        UICountButton.layer.cornerRadius = 80
        UICountButton.clipsToBounds = true
        // Do any additional setup after loading the view.
    }
    
    @IBAction func CountButton(_ sender: Any) {
        //Adds the count to the value of the button.
        let Count = UICountButton.title(for: .normal)
        let intCount = Int(Count!)! + 1
        let newCount = String(intCount)
        UICountButton.setTitle(newCount, for: .normal)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
