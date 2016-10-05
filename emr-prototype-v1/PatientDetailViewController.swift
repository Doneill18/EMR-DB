//
//  PatientDetailViewController.swift
//  emr-prototype-v1
//
//  Created by Gayle Ocampo on 11/8/15.
//  Copyright © 2015 Gayle Ocampo. All rights reserved.
//

import UIKit
import Parse

class PatientDetailViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITableViewDelegate, UITableViewDataSource
{
    //TODO: Segue to new controller from visit

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var patientFirstName: UILabel!
    @IBOutlet weak var patientLastName: UILabel!
    @IBOutlet weak var patientDOB: UILabel!
    @IBOutlet weak var patientAge: UILabel!
    @IBOutlet weak var patientSex: UILabel!
    @IBOutlet weak var patientHeight: UILabel!
    @IBOutlet weak var patientWeight: UILabel!
    @IBOutlet weak var patientImage: UIImageView!
    @IBOutlet weak var patientAllergies: UITextView!
    
    //Changing labels to spanish/english
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var allergiesLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var sexLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var dobLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    
    var currentObject: PFObject?
    var newVisits: [PFObject] = []
    var refreshControl: UIRefreshControl!
    var imagePicker: UIImagePickerController!
    
    @IBAction func takePhoto(sender: AnyObject)
    {
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .Camera
        
        //Activation of camera; inherited from the UIViewController
        presentViewController(imagePicker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?)
    {
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        patientImage.image = editingInfo![UIImagePickerControllerOriginalImage] as? UIImage
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        refreshControl = {
            let refreshControl = UIRefreshControl()
            refreshControl.addTarget(self, action: #selector(PatientDetailViewController.handleRefresh), forControlEvents: UIControlEvents.ValueChanged)
            
            return refreshControl
        }()
        tableView.addSubview(refreshControl)
        if let currentPatient = currentObject
        {
            patientImage.image = UIImage(named: "empty")
            patientFirstName.text = currentPatient["firstName"] as? String
            patientLastName.text = currentPatient["lastName"] as? String
            patientDOB.text = currentPatient["DOB"] as? String
            patientAge.text = currentPatient["age"] as? String
            patientSex.text = currentPatient["sex"] as? String
            patientHeight.text = currentPatient["height"] as? String
            patientWeight.text = currentPatient["weight"] as? String
            patientAllergies.text = currentPatient["allergies"] as? String
        }
        
        
        RunQuery()

        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        RunQuery()
    }
    
    func handleRefresh(){
        RunQuery()
        tableView.reloadData()
        refreshControl.endRefreshing()
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if let detailedVC = segue.destinationViewController as? NewVisitViewController {
            
                if segue.identifier == "segueToNewVisit"
                {
                    detailedVC.currentObject = currentObject
                }
                else
                {
                    print("segueToNewVisit was not found")
                }
        }
    }
    
    func RunQuery()
    {
        self.newVisits.removeAll()
        
        //Run query to find visits matching patientID
        let query = PFQuery(className: "NewVisit")
        query.whereKey("patientID", equalTo:currentObject!.objectId!)
        query.findObjectsInBackgroundWithBlock {
            (objects: [PFObject]?, error: NSError?) -> Void in
            
            if error == nil
            {
                if let objects = objects
                {
                    for object in objects
                    {
                        self.newVisits.append(object)
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
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return newVisits.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var cell = tableView.dequeueReusableCellWithIdentifier("pastVisits") as UITableViewCell!
        
        //Ensure the cell exists -- Parse recommendation
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "pastVisits")
        }
        
        //Extract values from the PFObject to display in the table view
        if let patient = newVisits[indexPath.row].createdAt
        {
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "MM/dd/yy" //Format style for date of patient visit
            let dateString = dateFormatter.stringFromDate(patient)
            cell?.textLabel?.text = dateString
        }
        
        return cell
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    @IBAction func englishButton(sender: AnyObject)
    {
        firstNameLabel.text = "First Name:"
        lastNameLabel.text = "Last Name:"
        allergiesLabel.text = "Allergies:"
        heightLabel.text = "Height:"
        weightLabel.text = "Weight:"
        dobLabel.text = "DOB:"
        ageLabel.text = "Age:"
        sexLabel.text = "Sex:"
    }
    
    @IBAction func spanishButton(sender: AnyObject)
    {
        firstNameLabel.text = "Nombre de Pila:"
        lastNameLabel.text = "Apellido:"
        allergiesLabel.text = "Alergias:"
        heightLabel.text = "Altura:"
        weightLabel.text = "Peso:"
        dobLabel.text = "FDN:"
        ageLabel.text = "Edad:"
        sexLabel.text = "Sexo:"
    }

}
