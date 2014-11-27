//
//  ParkingLotsController.swift
//  ParkingLot
//
//  Created by Steven De Cock on 29/10/14.
//  Copyright (c) 2014 Steven De Cock. All rights reserved.
//
import UIKit



class ParkingLotViewController : UITableViewController
{
    
    var lots : [ParkingLot] = []
    var task : NSURLSessionTask?
    
    override func viewDidLoad() {
        
            task = service.createFetchTask{
            lots in
            self.lots = lots
            self.tableView.reloadData()
        }
        task!.resume()
    }
    

    
    override func viewWillDisappear(animated: Bool) {
        task?.suspend()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let parkingLotController = segue.destinationViewController as ParkingLotController
        let lotSelect = lots[tableView.indexPathForSelectedRow()!.row]
        parkingLotController.lot = lotSelect
    }
    
    @IBAction func refresh(sender: UIRefreshControl) {
        
        task = service.createFetchTask{
            lots in
            self.lots = lots
            self.tableView.reloadData()
        }
        task!.resume()
        sender.endRefreshing()
    }
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lots.count
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("parkingLotCell") as UITableViewCell
        
        let lot = lots[indexPath.row]
        
        cell.textLabel.text = lot.description
        cell.detailTextLabel?.text = "\(lot.availableCapacity)/\(lot.totalCapacity)"
        
        return cell
    }
    
    
    
    
}