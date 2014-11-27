//
//  ParkingLotViewController.swift
//  ParkingLot
//
//  Created by Steven De Cock on 29/10/14.
//  Copyright (c) 2014 Steven De Cock. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class ParkingLotController : UITableViewController
{
    @IBOutlet weak var mapview: MKMapView!
    @IBOutlet weak var totalCapLabel: UILabel!
    @IBOutlet weak var availableCapLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var lot : ParkingLot!
    
    override func viewDidLoad() {
        
        navigationItem.title = lot.description
        descriptionLabel.text = lot.description
        totalCapLabel.text = "\(lot.totalCapacity)"
        availableCapLabel.text = "\(lot.availableCapacity)"
    
        let center = CLLocationCoordinate2D(latitude: lot.location.latitude, longitude: lot.location.longitude)
        let region = MKCoordinateRegionMakeWithDistance(center, 1000,1000)
        mapview.region = region
        
        let pin = MKPointAnnotation()
        pin.coordinate = center
        pin.title = lot.description
        
        mapview.addAnnotation(pin)
        
    }
    
    
    
    
    
}