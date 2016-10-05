//
//  MedicationDetailSpanishViewController.swift
//  emr-prototype-21116
//
//  Created by Sarah Dale on 03/18/16.
//  Copyright © 2015 Gayle Ocampo. All rights reserved.
//

import UIKit
import Parse

class MedicationDetailSpanishViewController: UIViewController {
    
    @IBOutlet weak var medicationNameSpanish: UITextField!
    @IBOutlet weak var medicationQuantity: UITextField!
    @IBOutlet weak var medicationNotesSpanish: UITextView!
    
    var currentObject: PFObject?
    
    @IBAction func saveMedication(sender: AnyObject) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let currentMedication = currentObject {
            medicationNameSpanish.text = currentMedication["medicationNameSpanish"] as? String
            medicationQuantity.text = currentMedication["medicationQuantity"] as? String
            medicationNotesSpanish.text = currentMedication["medicationNotesSpanish"] as? String
        }
        
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
