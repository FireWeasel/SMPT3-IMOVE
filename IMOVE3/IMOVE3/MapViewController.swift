//
//  MapViewController.swift
//  IMOVE3
//
//  Created by Fhict on 23/11/2017.
//  Copyright © 2017 fontys. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet weak var Map: MKMapView!
    @IBOutlet weak var ButtonRecenter: UIButton!
    var locationManager = CLLocationManager()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ButtonRecenter.layer.cornerRadius = 4
        ButtonRecenter.isHidden = true
        locationManager.delegate = self
       locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func TapMap(_ sender: Any) {
        ButtonRecenter.isHidden = false
        locationManager.stopUpdatingLocation()
        
    }
    
    @IBAction func CenterOnUser(_ sender: Any) {
        locationManager.startUpdatingLocation()
        ButtonRecenter.isHidden = true;
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    //MARK: Actions
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        //Set the map span to the users location.
        let location = locations[0]
        
        let span = MKCoordinateSpanMake(0.01, 0.01)
        let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        let region:MKCoordinateRegion = MKCoordinateRegionMake(myLocation, span)
        Map.setRegion(region, animated: true)
        self.Map.showsUserLocation = true
    }

}
