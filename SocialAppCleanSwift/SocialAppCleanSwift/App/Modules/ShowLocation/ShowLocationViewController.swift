//
//  ShowLocationViewController.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 29.11.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit
import MapKit

protocol IShowLocationViewController: class {
	// do someting...
}

class ShowLocationViewController: UIViewController {
	var interactor: IShowLocationInteractor!
	var router: IShowLocationRouter!
    
    let mapView: MKMapView = {
        let map = MKMapView()
        map.translatesAutoresizingMaskIntoConstraints = false
        return map
    }()

	override func viewDidLoad() {
        super.viewDidLoad()
		// do someting...
        
        setupViews()
        setupConstraints()
        
        if let lat = interactor.parameters?["lat"] as? String, let lng = interactor.parameters?["lng"] as? String {
            let coordinates: CLLocationCoordinate2D = CLLocationCoordinate2DMake(CLLocationDegrees(lat)!, CLLocationDegrees(lng)!)
            //mapView.setCenter(coordinates, animated: true)
            mapView.setRegion(MKCoordinateRegion(center: coordinates, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)), animated: true)
        }
    }
    
    private func setupViews() {
        view.addSubview(mapView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0), //TODO: use safe top anchor
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -0),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension ShowLocationViewController: IShowLocationViewController {
	// do someting...
}

extension ShowLocationViewController {
	// do someting...
}

extension ShowLocationViewController {
	// do someting...
}
