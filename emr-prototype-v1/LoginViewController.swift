//
//  LoginViewController.swift
//  emr-prototype-v1
//
//  Created by Gayle Ocampo on 11/8/15.
//  Copyright © 2015 Gayle Ocampo. All rights reserved.
//

import UIKit
import Parse
import Bolts

class LoginViewController: UIViewController {

    @IBOutlet weak var parseUsername: UITextField!
    @IBOutlet weak var parsePassword: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //delete this comment
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnLogin(sender: AnyObject)
    {
        let username = parseUsername.text
        let password = parsePassword.text
        login(username!, password: password!)
    }
    
    func login(username: String, password: String)
    {
        PFUser.logInWithUsernameInBackground(username, password: password)
        {
            (user: PFUser?, error: NSError?) -> Void in
            if user != nil
            {
                self.performSegueWithIdentifier("segueToMainDashboard", sender: nil)
            }
            else
            {
                //Alert user that username/password combination does not exist
                print(error?.userInfo["error"])
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
