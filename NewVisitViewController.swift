//
//  NewVisitViewController.swift
//  emr-prototype-v1
//
//  Created by Jackson O'Brien on 2/9/16.
//  Copyright © 2016 Gayle Ocampo. All rights reserved.
//

import UIKit
import Parse


class NewVisitViewController: UIViewController {
    
    @IBOutlet weak var patientFirstName: UILabel!
    @IBOutlet weak var patientLastName: UILabel!
    @IBOutlet weak var patientDOB: UILabel!
    @IBOutlet weak var patientAge: UILabel!
    @IBOutlet weak var patientSex: UILabel!
    
    //New visit information to be entered and stored in Parse
    @IBOutlet weak var patientHeight: UITextField!
    @IBOutlet weak var patientWeight: UITextField!
    @IBOutlet weak var patientAllergies: UITextView!
    @IBOutlet weak var patientHeartRate: UITextField!
    @IBOutlet weak var patientBloodPressure: UITextField!
    @IBOutlet weak var patientGlucose: UITextField!
    @IBOutlet weak var patientCurrentMeds: UITextView!
    @IBOutlet weak var patientNotes: UITextView!
    
    
    //Purpose of Visit Controls
    @IBOutlet weak var switchAnemia: UISwitch! //Array pos 0
    @IBOutlet weak var switchBlurryVision: UISwitch! //Array pos 1
    @IBOutlet weak var switchChills: UISwitch! //Array pos 2
    @IBOutlet weak var switchCongestion: UISwitch! //Array pos 3
    @IBOutlet weak var switchConstipation: UISwitch! //Array pos 3
    @IBOutlet weak var switchCoughing: UISwitch! //Array pos 3
    @IBOutlet weak var switchCramping: UISwitch! //Array pos 3
    @IBOutlet weak var switchDiarrhea: UISwitch! //Array pos 3
    @IBOutlet weak var switchDizziness: UISwitch! //Array pos 3
    @IBOutlet weak var switchFatigue: UISwitch! //Array pos 3
    @IBOutlet weak var switchFever: UISwitch! //Array pos 3
    @IBOutlet weak var switchHeadache: UISwitch! //Array pos 3
    @IBOutlet weak var switchHighBP: UISwitch! //Array pos 3
    @IBOutlet weak var switchLaceration: UISwitch! //Array pos 3
    @IBOutlet weak var switchNoAppetite: UISwitch! //Array pos 3
    @IBOutlet weak var switchPain: UISwitch! //Array pos 3
    @IBOutlet weak var switchRash: UISwitch! //Array pos 3
    @IBOutlet weak var switchRunnyNose: UISwitch! //Array pos 3
    @IBOutlet weak var switchSeasonalAllergies: UISwitch! //Array pos 3
    @IBOutlet weak var switchSneezing: UISwitch! //Array pos 3
    @IBOutlet weak var switchSoreThroat: UISwitch! //Array pos 3
    @IBOutlet weak var switchSkinSpots: UISwitch! //Array pos 3
    @IBOutlet weak var switchStomachAche: UISwitch! //Array pos 3
    @IBOutlet weak var switchTroubleBreathing: UISwitch! //Array pos 3
    @IBOutlet weak var switchTroubleSleeping: UISwitch! //Array pos 3
    @IBOutlet weak var switchVaginalInfection: UISwitch! //Array pos 3
    @IBOutlet weak var switchVomiting: UISwitch! //Array pos 3
    @IBOutlet weak var switchOther: UISwitch! //Array pos 3
    
    //Changing labels to spanish/english
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var allergiesLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var sexLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var dobLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    
    @IBOutlet weak var anemiaLabel: UILabel!
    @IBOutlet weak var blurryvisionLabel: UILabel!
    @IBOutlet weak var chillsLabel: UILabel!
    @IBOutlet weak var congestionLabel: UILabel!
    @IBOutlet weak var constipationLabel: UILabel!
    @IBOutlet weak var coughingLabel: UILabel!
    @IBOutlet weak var crampingLabel: UILabel!
    @IBOutlet weak var diarrheaLabel: UILabel!
    @IBOutlet weak var dizzinessLabel: UILabel!
    @IBOutlet weak var fatigueLabel: UILabel!
    @IBOutlet weak var feverLabel: UILabel!
    @IBOutlet weak var headacheLabel: UILabel!
    @IBOutlet weak var highbpLabel: UILabel!
    @IBOutlet weak var lacerationLabel: UILabel!
    @IBOutlet weak var noappetiteLabel: UILabel!
    @IBOutlet weak var painLabel: UILabel!
    @IBOutlet weak var rashLabel: UILabel!
    @IBOutlet weak var runnynoseLabel: UILabel!
    @IBOutlet weak var seasonalallergiesLabel: UILabel!
    @IBOutlet weak var sneezingLabel: UILabel!
    @IBOutlet weak var sorethroatLabel: UILabel!
    @IBOutlet weak var skinspotsLabel: UILabel!
    @IBOutlet weak var stomachacheLabel: UILabel!
    @IBOutlet weak var troublebreathingLabel: UILabel!
    @IBOutlet weak var troublesleepingLabel: UILabel!
    @IBOutlet weak var vaginalinfectionLabel: UILabel!
    @IBOutlet weak var vomitingLabel: UILabel!
    @IBOutlet weak var otherLabel: UILabel!
    
    @IBOutlet weak var notesLabel: UILabel!
    @IBOutlet weak var currentMedsLabel: UILabel!
    @IBOutlet weak var glucoseLabel: UILabel!
    @IBOutlet weak var bloodPressureLabel: UILabel!
    @IBOutlet weak var heartRateLabel: UILabel!
    @IBOutlet weak var purposeofvisitLabel: UILabel!
    
    var switchArray:[UISwitch] = []
    
    var currentObject: PFObject?
    
    override func viewDidLoad()
    {
        switchArray = [switchAnemia,switchBlurryVision,switchChills,switchCongestion,switchConstipation,switchCoughing,switchCramping,switchDiarrhea,switchDizziness,switchFatigue,switchFever,switchHeadache,switchHighBP, switchLaceration,switchNoAppetite,switchPain,switchRash,switchRunnyNose,switchSeasonalAllergies,switchSneezing,switchSoreThroat,switchSkinSpots,switchStomachAche,switchTroubleBreathing,switchTroubleSleeping,switchVaginalInfection,switchVomiting,switchOther]
        
        super.viewDidLoad()
        
            let currentPatient = currentObject!
        
            patientFirstName.text = currentPatient["firstName"] as? String
            patientLastName.text = currentPatient["lastName"] as? String
            patientDOB.text = currentPatient["DOB"] as? String
            patientAge.text = currentPatient["age"] as? String
            patientSex.text = currentPatient["sex"] as? String
            patientHeight.text = currentPatient["height"] as? String
            patientWeight.text = currentPatient["weight"] as? String
            //let purposeOfVisit = currentPatient["purposeOfVisit"] as! [Bool]
            //switchAnemia.on = purposeOfVisit[0]
            //switchBlurryVision.on = purposeOfVisit[1]
            //switchChills.on = purposeOfVisit[2]
        
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveVisit(sender: AnyObject)
    {
        //Create and insert a new object
        let newVisit = PFObject(className: "NewVisit")
        
        let currentPatient = currentObject!
        
        //TODO: Populate the new visit

        newVisit["patientID"] = currentPatient.objectId
        newVisit["firstName"] = currentPatient["firstName"]
        newVisit["lastName"] = currentPatient["lastName"]
        
        newVisit["isWaiting"] = true;
        newVisit["height"] = patientHeight.text
        newVisit["weight"] = patientWeight.text
        newVisit["allergies"] = patientAllergies.text
        newVisit["heartRate"] = patientHeartRate.text
        newVisit["bloodPressure"] = patientBloodPressure.text
        newVisit["glucose"] = patientGlucose.text
        newVisit["currentMeds"] = patientCurrentMeds.text
        newVisit["notes"] = patientNotes.text
        newVisit["purposeOfVisit"] = {() -> [Bool] in
            var vals:[Bool] = []
            for(var i in 0 ..< self.switchArray.count){
                vals.append(self.switchArray[i].on)
            }
            return vals
        }()
        
        //Save visit on server
        newVisit.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            if(success)
            {
                self.navigationController?.popViewControllerAnimated(true)
            }
            else
            {
                print("uh oh")
            }
        }
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
        
        anemiaLabel.text = "Anemia"
        blurryvisionLabel.text = "Blurry Vision"
        chillsLabel.text = "Chills"
        congestionLabel.text = "Congestion"
        constipationLabel.text = "Constipation"
        coughingLabel.text = "Coughing"
        crampingLabel.text = "Cramping"
        diarrheaLabel.text = "Diarrhea"
        dizzinessLabel.text = "Dizziness"
        fatigueLabel.text = "Fatigue"
        feverLabel.text = "Fever"
        headacheLabel.text = "Headache"
        highbpLabel.text = "High BP"
        lacerationLabel.text = "Laceration"
        noappetiteLabel.text = "No Appetite"
        painLabel.text = "Pain"
        rashLabel.text = "Rash"
        runnynoseLabel.text = "Runny Nose"
        seasonalallergiesLabel.text = "Seasonal Allergies"
        sneezingLabel.text = "Sneezing"
        sorethroatLabel.text = "Sore Throat"
        skinspotsLabel.text = "Skin Spots"
        stomachacheLabel.text = "Stomach Ache"
        troublebreathingLabel.text = "Trouble Breathing"
        troublesleepingLabel.text = "Trouble Sleeping"
        vaginalinfectionLabel.text = "Vaginal Infection"
        vomitingLabel.text = "Vomiting"
        otherLabel.text = "Other"
        
        notesLabel.text = "Notes:"
        currentMedsLabel.text = "Current Medications:"
        glucoseLabel.text = "Glucose:"
        bloodPressureLabel.text = "Blood Pressure:"
        heartRateLabel.text = "Heart Rate:"
        purposeofvisitLabel.text = "Purpose of Visit:"
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
        
        anemiaLabel.text = "Anemia"
        blurryvisionLabel.text = "Visión Borrosa"
        chillsLabel.text = "Resfriado"
        congestionLabel.text = "Congestión"
        constipationLabel.text = "Estreñimiento"
        coughingLabel.text = "Tos"
        crampingLabel.text = "Calambres"
        diarrheaLabel.text = "Diarrea"
        dizzinessLabel.text = "Mareo"
        fatigueLabel.text = "Fatiga"
        feverLabel.text = "Fiebre"
        headacheLabel.text = "Dolor de Cabeza"
        highbpLabel.text = "Alta Presion Sanguinea"
        lacerationLabel.text = "Laceración"
        noappetiteLabel.text = "Sin Apetito"
        painLabel.text = "Dolor"
        rashLabel.text = "Erupción"
        runnynoseLabel.text = "Nariz que Moquea"
        seasonalallergiesLabel.text = "Alergias Estacionales"
        sneezingLabel.text = "Estornudos"
        sorethroatLabel.text = "Dolor de Garganta"
        skinspotsLabel.text = "Manchas en la Piel"
        stomachacheLabel.text = "Dolor de Estómago"
        troublebreathingLabel.text = "Dificultad para Respirar"
        troublesleepingLabel.text = "Problemas para Dormir"
        vaginalinfectionLabel.text = "Infección Vaginal"
        vomitingLabel.text = "Vómitos"
        otherLabel.text = "Otro"
        
        notesLabel.text = "Notas:"
        currentMedsLabel.text = "Medicamentos Actuales:"
        glucoseLabel.text = "Glucosa:"
        bloodPressureLabel.text = "Presión Sanguínea:"
        heartRateLabel.text = "Ritmo Cardíaco:"
        purposeofvisitLabel.text = "Propósito de la Visita:"
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





