//
//  WaitingListViewController.swift
//  emr-prototype-v1
//
//  Created by Gayle Ocampo on 11/8/15.
//  Copyright © 2015 Gayle Ocampo. All rights reserved.
//

import UIKit
import Parse
import Bolts

class WaitingListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {

    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var tableView: UITableView!
    
    var waitingList: [PFObject!] = []
    
    override func viewDidLoad()
    {
        tableView.delegate = self
        tableView.dataSource = self
        RunQuery()
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        RunQuery()
    }
    
    func RunQuery(){
        self.waitingList.removeAll()
        //Run query to find visits matching patientID
        let query = PFQuery(className: "NewVisit")
        query.orderByAscending("createdAt")
        query.whereKey("isWaiting", equalTo:true)
        query.findObjectsInBackgroundWithBlock {
            (objects: [PFObject]?, error: NSError?) -> Void in
            
            if error == nil
            {
                if let objects = objects
                {
                    for object in objects
                    {
                        self.waitingList.append(object)
                    }
                    self.tableView.reloadData()
                }
            } else
            {
                //Log details of failure
                print("Error: \(error!) \(error!.userInfo)")
            }
        }
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return waitingList.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        var cell = tableView.dequeueReusableCellWithIdentifier("waitingCell") as UITableViewCell!
        
        //Ensure the cell exists -- Parse recommendation
        if cell == nil
        {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "waitingCell")
        }
        
        //Extract values from the PFObject to display in the table view
        if let patient = waitingList[indexPath.row]
        {
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "MM/dd/yy' 'hh:mm:ss" //Format style for date of patient visit
            let dateString = dateFormatter.stringFromDate(patient.createdAt!)
            let patientID = patient["patientID"] as! String
            let query = PFQuery(className: "Patients")
            do{
                let user = try query.getObjectWithId(patientID)
                let firstName = user["firstName"] as! String
                let lastName = user["lastName"] as! String
                cell?.textLabel?.text = dateString + " - " + lastName + ", " + firstName
            } catch{
                cell?.textLabel?.text = "uh oh"
            }
        }
        
        return cell
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int{
        return 1
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if let detailedVC = segue.destinationViewController as? DiagnosisViewController, let indexPath = self.tableView.indexPathForSelectedRow {
            
            if segue.identifier == "segueToDiagnosis"
            {
                detailedVC.currentObject = waitingList[indexPath.row]
            }
            else
            {
                print("segueToDiagnosis was not found")
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
