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

class MapViewController: UIViewController, CLLocationManagerDelegate,MKMapViewDelegate {
    @IBOutlet weak var Map: MKMapView!
    @IBOutlet weak var ButtonRecenter: UIButton!
    var locationManager = CLLocationManager()
    var myLocation = CLLocationCoordinate2D()
    
    var coordinates: [[Double]]!
    var names:[String]!
    var descriptions:[String]!
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ButtonFeatures()
        LocationManagerStartUp()
        //SetChallenges()
        
        coordinates = [[51.441748,5.483254],[51.445610,5.468737],[51.456007,5.476780]]
        names = ["Push-Up Challenge","Cycling Challenge","Climbing Challenge"]
        descriptions = ["Hey there sporter, Try to do as maney push-ups as you can within 5 minutes. Try to beat your friends!","Hey there sporter, try to cycle this route as fast as you can. Try to set a good time to beat all your friends","Hello sporter, you have arrived at a great climbing structure, Try to set a time climbing from front to back."]
        self.Map.delegate = self

        for i in 0...2
        {
            let coordinate = coordinates[i]
            let point = ChallengeAnnotation(coordinate: CLLocationCoordinate2D(latitude: coordinate[0] , longitude: coordinate[1] ))
            point.image = UIImage(named: "chal-\(i+1).jpg")
            point.name = names[i]
            point.desc = descriptions[i]
            self.Map.addAnnotation(point)
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
    
    /*
    func SetChallenges()
    {
        let challengeLocation = CLLocationCoordinate2D(latitude: 51.44950853626378, longitude: 5.479984190315008)
        let runChallenge1 = MKPointAnnotation()
        runChallenge1.coordinate = challengeLocation
        runChallenge1.title = "Running Challenge"
        runChallenge1.subtitle = "Run 4km"
        Map.addAnnotation(runChallenge1)
    }*/
    
    

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation
        {
            return nil
        }
        var annotationView = self.Map.dequeueReusableAnnotationView(withIdentifier: "Pin")
        if annotationView == nil{
            annotationView = AnnotationView(annotation: annotation, reuseIdentifier: "Pin")
            annotationView?.canShowCallout = false
        }else{
            annotationView?.annotation = annotation
        }
        annotationView?.image = UIImage(named: "chal")
        return annotationView
    }

    
   
    func mapView(_ mapView: MKMapView,
                 didSelect view: MKAnnotationView)
    {
        // 1
        if view.annotation is MKUserLocation
        {
            // Don't proceed with custom callout
            return
        }
        // 2
        let challengeAnnotation = view.annotation as! ChallengeAnnotation
        let views = Bundle.main.loadNibNamed("CustomAnnotationView", owner: nil, options: nil)
        let calloutView = views?[0] as! CustomAnnotationView
        calloutView.challengeName.text = challengeAnnotation.name
        calloutView.challengeDescription.text = challengeAnnotation.desc
        calloutView.challengeImage.image = challengeAnnotation.image
        //let button = UIButton(frame: calloutView.starbucksPhone.frame)
        //button.addTarget(self, action: #selector(ViewController.callPhoneNumber(sender:)), for: .touchUpInside)
        //calloutView.addSubview(button)
        // 3
        calloutView.center = CGPoint(x: view.bounds.size.width / 2, y: -calloutView.bounds.size.height*0.52)
        view.addSubview(calloutView)
       // mapView.setCenter((view.annotation?.coordinate)!, animated: true)
    }
    
    
    func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
        if view.isKind(of: AnnotationView.self)
        {
            for subview in view.subviews
            {
                subview.removeFromSuperview()
            }
        }
    }
}
