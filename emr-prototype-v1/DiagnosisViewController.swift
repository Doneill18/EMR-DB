//
//  DiagnosisViewController.swift
//  emr-prototype-v1
//
//  Created by Scheib on 5/5/16.
//  Copyright © 2016 Gayle Ocampo. All rights reserved.
//

import Foundation
import UIKit
import Parse
import Bolts

class DiagnosisViewController: UIViewController{
    
    //Check-In Triage Information
    @IBOutlet weak var patientFirstName: UILabel!
    @IBOutlet weak var patientLastName: UILabel!
    @IBOutlet weak var patientDOB: UILabel!
    @IBOutlet weak var patientAge: UILabel!
    @IBOutlet weak var patientSex: UILabel!
    @IBOutlet weak var patientHeight: UILabel!
    @IBOutlet weak var patientWeight: UILabel!
    @IBOutlet weak var patientAllergies: UITextView!
    @IBOutlet weak var patientHeartRate: UILabel!
    @IBOutlet weak var patientBloodPressure: UILabel!
    @IBOutlet weak var patientGlucose: UILabel!
    @IBOutlet weak var patientCurrentMeds: UITextView!
    @IBOutlet weak var patientPurposeOfVisit: UITextView!
    @IBOutlet weak var patientNotes: UITextView!
    
    //Diagnosis Switches
    @IBOutlet weak var switchAnemia: UISwitch!
    @IBOutlet weak var switchArthritis: UISwitch!
    @IBOutlet weak var switchAsthma: UISwitch!
    @IBOutlet weak var switchBackPain: UISwitch!
    @IBOutlet weak var switchBronchitis: UISwitch!
    @IBOutlet weak var switchCellulitis: UISwitch!
    @IBOutlet weak var switchCommonCold: UISwitch!
    @IBOutlet weak var switchConstipation: UISwitch!
    @IBOutlet weak var switchDentalCaries: UISwitch!
    @IBOutlet weak var switchDepression: UISwitch!
    @IBOutlet weak var switchDermatitis: UISwitch!
    @IBOutlet weak var switchDiabetes: UISwitch!
    @IBOutlet weak var switchEarInfection: UISwitch!
    @IBOutlet weak var switchFlu: UISwitch!
    @IBOutlet weak var switchFolliculitis: UISwitch!
    @IBOutlet weak var switchGERD: UISwitch!
    @IBOutlet weak var switchGastritis: UISwitch!
    @IBOutlet weak var switchGastroenteritis: UISwitch!
    @IBOutlet weak var switchGingivitis: UISwitch!
    @IBOutlet weak var switchGout: UISwitch!
    @IBOutlet weak var switchGripe: UISwitch!
    @IBOutlet weak var switchHeatRash: UISwitch!
    @IBOutlet weak var switchHighBloodSugar: UISwitch!
    @IBOutlet weak var switchHighCholesterol: UISwitch!
    @IBOutlet weak var switchHypertension: UISwitch!
    @IBOutlet weak var switchImpetigo: UISwitch!
    @IBOutlet weak var switchKidneyStone: UISwitch!
    @IBOutlet weak var switchLaryngitis: UISwitch!
    @IBOutlet weak var switchMenopause: UISwitch!
    @IBOutlet weak var switchMigraine: UISwitch!
    @IBOutlet weak var switchMusclePain: UISwitch!
    @IBOutlet weak var switchOtitisMedia: UISwitch!
    @IBOutlet weak var switchParasites: UISwitch!
    @IBOutlet weak var switchPharyngitis: UISwitch!
    @IBOutlet weak var switchPregnant: UISwitch!
    @IBOutlet weak var switchPsoriasis: UISwitch!
    @IBOutlet weak var switchReferToHospital: UISwitch!
    @IBOutlet weak var switchScabies: UISwitch!
    @IBOutlet weak var switchSeasonalAllergies: UISwitch!
    @IBOutlet weak var switchSinusitis: UISwitch!
    @IBOutlet weak var switchSkinInfection: UISwitch!
    @IBOutlet weak var switchTensionHeadache: UISwitch!
    @IBOutlet weak var switchTonsillitis: UISwitch!
    @IBOutlet weak var switchURI: UISwitch!
    @IBOutlet weak var switchUTI: UISwitch!
    @IBOutlet weak var switchOther: UISwitch!
    
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
    @IBOutlet weak var arthritisLabel: UILabel!
    @IBOutlet weak var asthmaLabel: UILabel!
    @IBOutlet weak var backpainLabel: UILabel!
    @IBOutlet weak var bronchitisLabel: UILabel!
    @IBOutlet weak var cellulitisLabel: UILabel!
    @IBOutlet weak var commoncoldLabel: UILabel!
    @IBOutlet weak var constipationLabel: UILabel!
    @IBOutlet weak var dentalcariesLabel: UILabel!
    @IBOutlet weak var depressionLabel: UILabel!
    @IBOutlet weak var dermatitisLabel: UILabel!
    @IBOutlet weak var diabetesLabel: UILabel!
    @IBOutlet weak var earinfectionLabel: UILabel!
    @IBOutlet weak var fluLabel: UILabel!
    @IBOutlet weak var folliculitisLabel: UILabel!
    @IBOutlet weak var gerdLabel: UILabel!
    @IBOutlet weak var gastritisLabel: UILabel!
    @IBOutlet weak var gastroenteritisLabel: UILabel!
    @IBOutlet weak var ginivitisLabel: UILabel!
    @IBOutlet weak var goutLabel: UILabel!
    @IBOutlet weak var gripeLabel: UILabel!
    @IBOutlet weak var heatrashLabel: UILabel!
    @IBOutlet weak var highbloodsugarLabel: UILabel!
    @IBOutlet weak var highcholesterolLabel: UILabel!
    @IBOutlet weak var hypertensionLabel: UILabel!
    @IBOutlet weak var impetigoLabel: UILabel!
    @IBOutlet weak var kidneystoneLabel: UILabel!
    @IBOutlet weak var laryngitisLabel: UILabel!
    @IBOutlet weak var menopauseLabel: UILabel!
    @IBOutlet weak var migraineLabel: UILabel!
    @IBOutlet weak var musclepainLabel: UILabel!
    @IBOutlet weak var otitismediaLabel: UILabel!
    @IBOutlet weak var parasitesLabel: UILabel!
    @IBOutlet weak var pharyngitisLabel: UILabel!
    @IBOutlet weak var pregnantLabel: UILabel!
    @IBOutlet weak var psoriasisLabel: UILabel!
    @IBOutlet weak var refertohospitalLabel: UILabel!
    @IBOutlet weak var scabiesLabel: UILabel!
    @IBOutlet weak var seasonalallergiesLabel: UILabel!
    @IBOutlet weak var sinusitisLabel: UILabel!
    @IBOutlet weak var skininfectionLabel: UILabel!
    @IBOutlet weak var tensionheadacheLabel: UILabel!
    @IBOutlet weak var tonsillitisLabel: UILabel!
    @IBOutlet weak var uriLabel: UILabel!
    @IBOutlet weak var utiLabel: UILabel!
    @IBOutlet weak var otherLabel: UILabel!
    
    @IBOutlet weak var prescriptionLabel: UILabel!
    @IBOutlet weak var notesLabel: UILabel!
    @IBOutlet weak var currentMedsLabel: UILabel!
    @IBOutlet weak var glucoseLabel: UILabel!
    @IBOutlet weak var bloodPressureLabel: UILabel!
    @IBOutlet weak var heartRateLabel: UILabel!
    @IBOutlet weak var purposeofvisitLabel: UILabel!
    
    var purposeOfVisit:[String] = []
    var switchArray:[UISwitch] = []
    //Prescription Text Field
    @IBOutlet weak var prescription: UITextField!
    
    
    var currentObject: PFObject?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        switchArray = [switchAnemia,switchArthritis,switchAsthma,switchBackPain,switchBronchitis,switchCellulitis,switchCommonCold,switchConstipation,switchDentalCaries,switchDepression,switchDermatitis,switchDiabetes,switchEarInfection,switchFlu,switchFolliculitis,switchGERD,switchGastritis,switchGastroenteritis,switchGingivitis,switchGout,switchGripe,switchHeatRash,switchHighBloodSugar,switchHighCholesterol,switchHypertension,switchImpetigo,switchKidneyStone,switchLaryngitis,switchMenopause,switchMigraine,switchMusclePain,switchOtitisMedia,switchParasites,switchPharyngitis,switchPregnant,switchPsoriasis,switchReferToHospital,switchScabies,switchSeasonalAllergies,switchSinusitis,switchSkinInfection,switchTensionHeadache,switchTonsillitis,switchURI,switchUTI,switchOther]
        purposeOfVisit = ["Anemia","Blurry Vision","Chills","Congestion","Constipation","Coughing","Cramping","Diarrhea","Dizziness","Fatigue","Fever","Headache","High BP", "Laceration","No Appetite","Pain","Rash","Runny Nose","Seasonal Allergies","Sneezing","Sore Throat","Skin Spots","Stomache Ache","Trouble Breathing","Trouble Sleeping","Vaginal Infection","Vomiting","Other"]
        
        let currentVisit = currentObject!
        

        let patientID = currentVisit["patientID"] as? String
        let query = PFQuery(className: "Patients")
        do{
            let patient = try query.getObjectWithId(patientID!)
            patientFirstName.text = patient["firstName"] as? String
            patientLastName.text = patient["lastName"] as? String
            patientDOB.text = patient["DOB"] as? String
            patientAge.text = patient["age"] as? String
            patientSex.text = patient["sex"] as? String
        } catch{
            
        }        
        patientHeight.text = currentVisit["height"] as? String
        patientWeight.text = currentVisit["weight"] as? String
        patientAllergies.text = currentVisit["allergies"] as? String
        patientHeartRate.text = currentVisit["heartRate"] as? String
        patientBloodPressure.text = currentVisit["bloodPressure"] as? String
        patientGlucose.text = currentVisit["glucose"] as? String
        patientCurrentMeds.text = currentVisit["currentMeds"] as? String
        patientPurposeOfVisit.text = {() -> String in
            let POV = currentVisit["purposeOfVisit"] as? [Bool]
            var POVString = ""
            for(var i in 0 ..< POV!.count){
                if(POV![i]){
                    if(POVString.isEmpty){
                        POVString += self.purposeOfVisit[i]
                    } else {
                        POVString += ", " + self.purposeOfVisit[i]
                    }
                }
            }
            return POVString
        }()
        patientNotes.text = currentVisit["notes"] as? String
        
    }
    
    
    @IBAction func saveVisit(sender: AnyObject)
    {
        let currentVisit = currentObject!
        currentVisit["diagnosis"] = {() -> [Bool] in
            var vals:[Bool] = []
            for(var i=0; i<self.switchArray.count; i++){
                vals.append(self.switchArray[i].on)
            }
            return vals
            }()
        currentVisit["prescription"] = self.prescription.text
        currentVisit["isWaiting"] = false;
        currentVisit.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
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
        arthritisLabel.text = "Arthritis"
        asthmaLabel.text = "Asthma"
        backpainLabel.text = "Back Pain"
        bronchitisLabel.text = "Bronchitis"
        cellulitisLabel.text = "Cellulitis"
        commoncoldLabel.text = "Common Cold"
        constipationLabel.text = "Constipation"
        dentalcariesLabel.text = "Dental Caries"
        depressionLabel.text = "Depression"
        dermatitisLabel.text = "Dermatitis"
        diabetesLabel.text = "Diabetes"
        earinfectionLabel.text = "Ear Infection"
        fluLabel.text = "Flu"
        folliculitisLabel.text = "Folliculitis"
        gerdLabel.text = "GERD"
        gastritisLabel.text = "Gastritis"
        gastroenteritisLabel.text = "Gastrenteristis"
        ginivitisLabel.text = "Ginivitis"
        goutLabel.text = "Gout"
        gripeLabel.text = "Gripe"
        heatrashLabel.text = "Heat Rash"
        highbloodsugarLabel.text = "High Blood Pressure"
        highcholesterolLabel.text = "High Cholesterol"
        hypertensionLabel.text = "Hypertension"
        impetigoLabel.text = "Impetigo"
        kidneystoneLabel.text = "Kidney Stone"
        laryngitisLabel.text = "Laryngitis"
        menopauseLabel.text = "Menopause"
        migraineLabel.text = "Migraine"
        musclepainLabel.text = "Muscle Pain"
        otitismediaLabel.text = "Otitis Media"
        parasitesLabel.text = "Parasites"
        pharyngitisLabel.text = "Pharyngitis"
        pregnantLabel.text = "Pregnant"
        psoriasisLabel.text = "Psoriasistal"
        refertohospitalLabel.text = "Refer to Hospital"
        scabiesLabel.text = "Scabies"
        seasonalallergiesLabel.text = "Seasonal Allergies"
        sinusitisLabel.text = "Sinusitis"
        skininfectionLabel.text = "Skin Infection"
        tensionheadacheLabel.text = "Tension Headache"
        tonsillitisLabel.text = "Tonsillitis"
        uriLabel.text = "URI"
        utiLabel.text = "UTI"
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
        arthritisLabel.text = "Artritis"
        asthmaLabel.text = "Asma"
        backpainLabel.text = "Dolor de Espalda"
        bronchitisLabel.text = "Bronquitis"
        cellulitisLabel.text = "Celulitis"
        commoncoldLabel.text = "Resfriado Comun"
        constipationLabel.text = "Estreñimiento"
        dentalcariesLabel.text = "Caries Dental"
        depressionLabel.text = "Depresión"
        dermatitisLabel.text = "Dermatitis"
        diabetesLabel.text = "Diabetes"
        earinfectionLabel.text = "Infección en el Oído"
        fluLabel.text = "Gripe"
        folliculitisLabel.text = "Foliculitis"
        gerdLabel.text = ""
        gastritisLabel.text = "Gastritis"
        gastroenteritisLabel.text = "Gastroenteritis"
        ginivitisLabel.text = "Ginivitis"
        goutLabel.text = "Gota"
        gripeLabel.text = "Queja"
        heatrashLabel.text = "Sarpullido"
        highbloodsugarLabel.text = "Azúcar en la Sangre"
        highcholesterolLabel.text = "Colesterol Alto"
        hypertensionLabel.text = "Hipertensión"
        impetigoLabel.text = "Impétigo"
        kidneystoneLabel.text = "Cálculos Renales"
        laryngitisLabel.text = "Laringitis"
        menopauseLabel.text = "Menopausia"
        migraineLabel.text = "Migraña"
        musclepainLabel.text = "Dolor Muscular"
        otitismediaLabel.text = "Otitis Media"
        parasitesLabel.text = "Parásitos"
        pharyngitisLabel.text = "Faringitis"
        pregnantLabel.text = "Embarazada"
        psoriasisLabel.text = "Psoriasis"
        refertohospitalLabel.text = "Referirse a un Hospital"
        scabiesLabel.text = "Sarna"
        seasonalallergiesLabel.text = "Alergias Estacionales"
        sinusitisLabel.text = "Sinusitis"
        skininfectionLabel.text = "Infección en la Piel"
        tensionheadacheLabel.text = "Cefalea Tensional"
        tonsillitisLabel.text = "Amigdalitis"
        uriLabel.text = "Infección del Tracto Respiratorio Superior"
        utiLabel.text = "Infección del Tracto Urinario"
        otherLabel.text = "Otro"
        
        notesLabel.text = "Notas:"
        currentMedsLabel.text = "Medicamentos Actuales:"
        glucoseLabel.text = "Glucosa:"
        bloodPressureLabel.text = "Presión Sanguínea:"
        heartRateLabel.text = "Ritmo Cardíaco:"
        purposeofvisitLabel.text = "Propósito de la Visita:"
    }
}
