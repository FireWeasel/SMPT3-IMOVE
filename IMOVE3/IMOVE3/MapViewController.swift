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
    var myLocation = CLLocationCoordinate2D()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ButtonFeatures()
        
        LocationManagerStartUp()
        //SetChallenges()
        
        
        
        let challengeLocation = CLLocationCoordinate2D(latitude: 51.44950853626378, longitude: 5.479984190315008)
        let runChallenge1 = MKPointAnnotation()
        runChallenge1.coordinate = challengeLocation
        runChallenge1.title = "Running Challenge"
        runChallenge1.subtitle = "Run 4km"
        Map.addAnnotation(runChallenge1)
        let run1Placemark = MKPlacemark(coordinate: challengeLocation, addressDictionary: nil)
        let run1MapItem = MKMapItem(placemark: run1Placemark)
        
        let locationPlacemark = MKPlacemark(coordinate: myLocation, addressDictionary: nil)
        let locationMapItem = MKMapItem(placemark: locationPlacemark)
        
        
        let directionRequest = MKDirectionsRequest()
        directionRequest.source = locationMapItem
        directionRequest.destination = run1MapItem
        directionRequest.transportType = .walking
        
        let directions = MKDirections(request: directionRequest)
        directions.calculate {
            (response, error) -> Void in
            
            guard let response = response else {
                if let error = error {
                    print("Error: \(error)")
                }
                
                return
            }
            
            let route = response.routes[0]
            self.Map.add((route.polyline), level: MKOverlayLevel.aboveRoads)
            
            let rect = route.polyline.boundingMapRect
            self.Map.setRegion(MKCoordinateRegionForMapRect(rect), animated: true)
        }
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
        myLocation = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        let region:MKCoordinateRegion = MKCoordinateRegionMake(myLocation, span)
        Map.setRegion(region, animated: true)
        self.Map.showsUserLocation = true
    }
    
    func ButtonFeatures()
    {
        ButtonRecenter.layer.cornerRadius = 4
        ButtonRecenter.isHidden = true
    }
    
    func LocationManagerStartUp()
    {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
    }
    
    func SetChallenges()
    {
        let challengeLocation = CLLocationCoordinate2D(latitude: 51.44950853626378, longitude: 5.479984190315008)
        let runChallenge1 = MKPointAnnotation()
        runChallenge1.coordinate = challengeLocation
        runChallenge1.title = "Running Challenge"
        runChallenge1.subtitle = "Run 4km"
        Map.addAnnotation(runChallenge1)
    }
    

}
