//
//  CompletedChallengeViewController.swift
//  IMOVE_Test
//
//  Created by Fhict on 14/12/2017.
//  Copyright © 2017 Fhict. All rights reserved.
//

import UIKit

class CompletedChallengeViewController: UIViewController,UITableViewDelegate, UITableViewDataSource  {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nrLabel: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var count : Int!
    var score : String!
    var challenge: ChallengeAnnotation!
    var leaderboardList = [LeaderBoard]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        tableView.delegate = self
        tableView.dataSource = self
        self.nameLabel.text = challenge.name
        self.nrLabel.text = String(self.count)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    */
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("hey")
        return leaderboardList.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for:indexPath)
        cell.textLabel?.text = leaderboardList[indexPath.row].name
        return cell
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
