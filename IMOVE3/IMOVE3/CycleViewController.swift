//
//  CycleViewController.swift
//  IMOVE3
//
//  Created by Fhict on 14/12/2017.
//  Copyright © 2017 fontys. All rights reserved.
//

import UIKit

class CycleViewController: UIViewController {

    @IBOutlet weak var CountDown: UILabel!
    @IBOutlet weak var ExerciseButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descLabel: UITextView!
    
    var challenge:ChallengeAnnotation!
    var timer = Timer()
    var seconds = 300
    var isTimerRunning = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ExerciseButton.layer.cornerRadius = 10
        ExerciseButton.clipsToBounds = true
        self.nameLabel.text = challenge.name!
        self.descLabel.text = challenge.desc!
        startTimer()
        // Do any additional setup after loading the view.
    }
    
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(PushUpViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer(){
        seconds -= 1
        CountDown.text = timeString(time: TimeInterval(seconds))
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func timeString(time:TimeInterval) -> String {
        //let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        let milliseconds = (Int(time)%1) * 1000
        return String(format:"%02i:%02i:%02i", minutes, seconds, milliseconds)
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
