//
//  ParkingLot.swift
//  ParkingLot
//
//  Created by Steven De Cock on 29/10/14.
//  Copyright (c) 2014 Steven De Cock. All rights reserved.
//

import Foundation


class ParkingLot
{
    let description: String
    var availableCapacity: Int
    let totalCapacity : Int
    let location : Location
    
    init(description: String, location: Location, availableCapacity: Int, totalCapacity: Int)
    {
        self.description = description
        self.location = location
        self.totalCapacity = totalCapacity
        self.availableCapacity = availableCapacity
    }
    
}

struct Location
{
    let latitude: Double
    let longitude: Double
}