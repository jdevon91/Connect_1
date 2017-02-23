//
//  SignInVC.swift
//  Connect_1
//
//  Created by Jesse Budhlall on 2017-02-08.
//  Copyright © 2017 Jesse Budhlall. All rights reserved.
//

import UIKit
import Firebase

class SignInVC: UIViewController {
    
    let loginToMain = "LoginToMain"
    
 
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBAction func signInBtn(_ sender: Any){
        
    FIRAuth.auth()!.signIn(withEmail: emailField.text!, password: passwordField.text!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FIRAuth.auth()!.addStateDidChangeListener() { auth, user in
            
            if user != nil {
                
                self.performSegue(withIdentifier: self.loginToMain, sender: nil)
            }
        }

        
    }
    
}
