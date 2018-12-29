//
//  SearchViewController.swift
//  Tanta Services
//
//  Created by Youssef on 11/22/18.
//  Copyright © 2018 Tantaservices. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {
    
    let mapView: MKMapView = {
        let txt = MKMapView()
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    
    var long = 0.00
    var lat = 0.00
    
    init(long: Double, lat: Double) {
        super.init(nibName: nil, bundle: nil)
        
        self.long = long
        self.lat = lat
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()

            mapView.delegate = self
    }
    
    fileprivate func setupLayout() {
        view.addSubview(mapView)
        mapView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .zero)
        
        addAnnotation()
    }
    

    
    
    
    fileprivate func addAnnotation() {
        let annotation = MKPointAnnotation()
        //annotation.title = "Point"
        annotation.coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
        mapView.addAnnotation(annotation)
        
        
//        let locationManager = CLLocationManager()
//        locationManager.delegate = self
//        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        //Zoom to user location
        let viewRegion = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 200, longitudinalMeters: 200)
            mapView.setRegion(viewRegion, animated: true)
        
        // we can make navigate to the location

    }
    
    
    
    
    
    
    
    // here from add company
    fileprivate func zoomToUserLocation() {
//        let locationManager = CLLocationManager()
//        locationManager.delegate = self
//        locationManager.desiredAccuracy = kCLLocationAccuracyBest
//
//        //Zoom to user location
//        if let userLocation = locationManager.location?.coordinate {
//            let viewRegion = MKCoordinateRegionMakeWithDistance(userLocation, 200, 200)
//            mapView.setRegion(viewRegion, animated: false)
//        }
//
//        self.locationManager = locationManager
//
//        DispatchQueue.main.async {
//            self.locationManager.startUpdatingLocation()
//        }
    }
   
}
