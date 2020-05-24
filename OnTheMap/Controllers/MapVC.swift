//
//  MapVC.swift
//  OnTheMap
//
//  Created by Fabien Lebon on 18/05/2020.
//  Copyright © 2020 Fabien Lebon. All rights reserved.
//

import UIKit
import MapKit

class MapVC: UIViewController {

    @IBOutlet weak var map: MKMapView!
    
    var annotations = [MKPointAnnotation]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populatePointsMap(params: "limit=10&order=-updatedAt")
        map.delegate = self
        
        
    }
    
    func populatePointsMap(params: String){
        OTMClient.getStudentLocation(params: params, completion: {
            (results, error) in
            
            PinModel.pins = results
            DispatchQueue.main.async {
                self.annotations = self.getMKAnnotations(PinModel.pins)
                self.map.addAnnotations(self.annotations)
            }
            
        })
    }
    
    func getMKAnnotations(_ pins: [Pin]) -> [MKPointAnnotation] {
        var annotationsExtract = [MKPointAnnotation]()
        for pin in pins {
            let lat = CLLocationDegrees(pin.latitude!)
            let long = CLLocationDegrees(pin.longitude!)
            
            let coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
            
            let first = pin.firstName!
            let last = pin.lastName!
            let mediaURL = pin.mediaURL ?? ""
            
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate
            annotation.title = "\(first) - \(last)"
            annotation.subtitle = mediaURL
            
            annotationsExtract.append(annotation)
        }
        
        return annotationsExtract
    }
    
    
}

extension MapVC:  MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let reuseId = "AnnotationView"
        
        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId) as? MKPinAnnotationView

        if pinView == nil {
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            pinView!.canShowCallout = true
            pinView!.pinTintColor = .blue
            pinView!.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        else {
            pinView!.annotation = annotation
        }
        
        return pinView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if control == view.rightCalloutAccessoryView {
            let app = UIApplication.shared
            if let toOpen = view.annotation?.subtitle! {
                app.open(URL(string: toOpen)!)
            }
        }
    }
}
