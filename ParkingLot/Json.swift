//
//  Json.swift
//  ParkingLot
//
//  Created by Steven De Cock on 29/10/14.
//  Copyright (c) 2014 Steven De Cock. All rights reserved.
//

import Foundation
class Json{
    
    class func readParkingLots(data : NSData) -> [ParkingLot]{
    
        let jsonData =  NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil) as NSDictionary
        let jsonLots = jsonData["Parkings"]!["parkings"]! as NSArray
        
        var parkingLots : [ParkingLot] = []
        
        for jsonLot in jsonLots {
            
            let jsonLot = jsonLot as NSDictionary
            let description = jsonLot["description"] as String
            let availableCapacity = jsonLot["availableCapacity"] as Int
            let totalCapacity = jsonLot["totalCapacity"] as Int
            let latitude = jsonLot["latitude"] as Double
            let longitude = jsonLot["longitude"] as Double
            
            let parkingLot = ParkingLot(description: description, location: Location(latitude: latitude, longitude: longitude), availableCapacity: availableCapacity, totalCapacity: totalCapacity)
            parkingLots.append(parkingLot)
        }
        return parkingLots
        
    }
}