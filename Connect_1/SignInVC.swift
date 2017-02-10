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
    @IBAction func signInBtn(_ sender: Any) {
        
    FIRAuth.auth()!.signIn(withEmail: emailField.text!, password: passwordField.text!)
    }
    
    @IBAction func registerBtn(_ sender: AnyObject) {
        
        let alert = UIAlertController(title: "Register", message: "Register", preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "Save", style: .default) { action in
            
        let emailField = alert.textFields![0]
        let passwordField = alert.textFields![1]
                                        
        FIRAuth.auth()!.createUser(withEmail: emailField.text!, password: passwordField.text!) { user, error in
            
            if error == nil {
                
                FIRAuth.auth()!.signIn(withEmail: self.emailField.text!, password: self.passwordField.text!)
            }
        }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default)
        
        alert.addTextField { textEmail in
            
            textEmail.placeholder = "Enter your email"
        }
        
        alert.addTextField { textPassword in
            
            textPassword.isSecureTextEntry = true
            textPassword.placeholder = "Enter your password"
        }
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
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
