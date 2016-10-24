//
//  CheckInTriageTableViewController.swift
//  emr-prototype-v1
//
//  Created by Gayle Ocampo on 11/11/15.
//  Copyright © 2015 Gayle Ocampo. All rights reserved.
//

import UIKit
import Parse
import ParseUI
import Bolts

class CheckInTriageTableViewController: PFQueryTableViewController {

    //Initialize the PFQueryTableView
    override init(style: UITableViewStyle, className: String!)
    {
        super.init(style: style, className: className)
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)!
        
        //Configure the PFQueryTableView
        self.parseClassName = "Patients"
        self.textKey = "lastName"
        self.pullToRefreshEnabled = true
        self.paginationEnabled = false
    }
    
    //Define query that will provide the data for the table view
    override func queryForTable() -> PFQuery
    {
        let query = PFQuery(className: "Patients")
        query.orderByAscending("lastName")
        
        return query
    }
    
    override func viewDidAppear(animated: Bool)
    {
        //Data reloading from Parse
        self.loadObjects()
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject?) -> PFTableViewCell? {
        
        //Create a cell
        var cell = tableView.dequeueReusableCellWithIdentifier("patientCell") as! PFTableViewCell!
        
        //Ensure the cell exists -- Parse recommendation
        if cell == nil {
            cell = PFTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "patientCell")
        }
        
        //Extract values from the PFObject to display in the table view
        let firstName = object!["firstName"] as? String
        let lastName = object!["lastName"] as? String

        cell?.textLabel?.text = (lastName! + ", " + firstName!)

        
        return cell
    }
    
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == .Delete
        {
            
            //Get current object from the Parse table
            let currentPatient: PFObject = objects![indexPath.row] as! PFObject
            
            //Delete object in background without blocking the app from resuming
            currentPatient.deleteInBackground()
            
            //Reload from server
            self.loadObjects();
            
        }
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if let detailedVC = segue.destinationViewController as? PatientDetailViewController, let indexPath = self.tableView.indexPathForSelectedRow {
            
            if segue.identifier == "segueToPatientDetail"
            {
                
                detailedVC.currentObject = objects![indexPath.row] as? PFObject
            }
            else if segue.identifier == "segueToNewPatient"
            {
                detailedVC.currentObject = nil
            }
        }
    }

}
