//
//  NewPatientViewController.swift
//  emr-prototype-v1
//
//  Created by Mariah Post on 5/3/16.
//  Copyright © 2016 Gayle Ocampo. All rights reserved.
//

import UIKit
import Parse

class NewPatientViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var patientFirstName: UITextField!
    @IBOutlet weak var patientLastName: UITextField!
    @IBOutlet weak var patientDOB: UITextField!
    @IBOutlet weak var patientAge: UITextField!
    @IBOutlet weak var patientSex: UISegmentedControl!
    @IBOutlet weak var patientImage: UIImageView!
    
    //Changing labels to spanish/english
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var sexLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var dobLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    
    var imagePicker: UIImagePickerController!
    let newPatient = PFObject(className: "Patients")

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
    
    
    @IBAction func savePatient(sender: AnyObject)
    {
        newPatient["firstName"] = patientFirstName.text
        newPatient["lastName"] = patientLastName.text
        newPatient["DOB"] = patientDOB.text
        newPatient["age"] = patientAge.text
                
        if patientSex.selectedSegmentIndex == 0
        {
            newPatient["sex"] = "Male"
        }
        else if patientSex.selectedSegmentIndex == 1
        {
            newPatient["sex"] = "Female"
        }
        
        //TODO: Age should be calculated??
        
        
        //        var calendar : NSCalendar = NSCalendar.currentCalendar()
        //        let birthday = patientDOB.date
        //
        //        let ageComponents = calendar.components(.Year,
        //        fromDate: birthday,
        //        toDate: now,
        //        options: [])
        //
        //        let age = ageComponents.year
        
        //Save patient on server
        newPatient.saveInBackgroundWithBlock {
            (success: Bool, error: NSError?) -> Void in
            if (success) {
                self.performSegueWithIdentifier("segueFromNewPatient", sender: nil)
            } else {
                print("uh oh")
            }
        }
        
        //performSegueWithIdentifier("segueFromNewPatient", sender: PFObject.self)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if let detailedVC = segue.destinationViewController as? PatientDetailViewController {
            
            if segue.identifier == "segueFromNewPatient"
            {
                detailedVC.currentObject = newPatient
            }
            else
            {
                print("segueToPatientDetail was not found")
            }
        }
    }
    
    @IBAction func englishButton(sender: AnyObject)
    {
        firstNameLabel.text = "First Name:"
        lastNameLabel.text = "Last Name:"
        dobLabel.text = "DOB:"
        ageLabel.text = "Age:"
        sexLabel.text = "Sex:"
    }
    
    @IBAction func spanishButton(sender: AnyObject)
    {
        firstNameLabel.text = "Nombre de Pila:"
        lastNameLabel.text = "Apellido:"
        dobLabel.text = "FDN:"
        ageLabel.text = "Edad:"
        sexLabel.text = "Sexo:"
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
