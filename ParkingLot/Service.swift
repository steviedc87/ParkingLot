//
//  Service.swift
//  ParkingLot
//
//  Created by Steven De Cock on 29/10/14.
//  Copyright (c) 2014 Steven De Cock. All rights reserved.
//

import Foundation
class Service {
    
    let baseUrl = NSURL(string: "http://datatank.gent.be/Mobiliteitsbedrijf")!
    
    let session : NSURLSession
    
    init(){
        session = NSURLSession(configuration: NSURLSessionConfiguration.ephemeralSessionConfiguration())
        
        
    }
    
    func createFetchTask(#completionHandler: [ParkingLot] ->Void) -> NSURLSessionTask
    {
        let request = NSMutableURLRequest(URL: baseUrl.URLByAppendingPathComponent("Parkings.json"))
        //closure function of block, code wordt uitgevoerd nadien
        return session.dataTaskWithRequest(request){
            data, response, error in
            let response = response as NSHTTPURLResponse
            if response.statusCode == 200 {
                let parkingLots = Json.readParkingLots(data)
                dispatch_async(dispatch_get_main_queue()){
                   completionHandler(parkingLots)
                }
                
            }
            
        }
    }
        
    
    
}
let service = Service()