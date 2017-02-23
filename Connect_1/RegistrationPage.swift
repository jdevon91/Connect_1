//
//  RegistrationPage.swift
//  Connect_1
//
//  Created by Jesse Budhlall on 2017-02-22.
//  Copyright © 2017 Jesse Budhlall. All rights reserved.
//

import UIKit
import Firebase

class RegistrationPage: UIViewController {
    
    let registrationToMain = "registrationToMain"
    
    @IBAction func backBtn(_ sender: Any) {
        
        dismiss(animated: true, completion: nil) // kills the current view controller
    }
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var passwordVerifyField: UITextField!
    @IBOutlet weak var medengTokenField: UITextField!
    @IBAction func registerBtn(_ sender: Any) {
        
        FIRAuth.auth()!.createUser(withEmail: emailField.text!, password: passwordField.text!) { user, error in
            
            if error == nil {
                
               // FIRAuth.auth()!.signIn(withEmail: self.emailField.text!, password: self.passwordField.text!)
                FIRAuth.auth()?.currentUser?.sendEmailVerification(completion: { (error) in
                    // ...
                })
            }
        }
    }
    @IBAction func tokenRequestBtn(_ sender: Any) {
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        FIRAuth.auth()!.addStateDidChangeListener() { auth, user in
            
            if user != nil {
                
                self.dismiss(animated: true, completion: nil) // kills the current view controller

               // self.performSegue(withIdentifier: self.registrationToMain, sender: nil)
            }
        }
    }
}
