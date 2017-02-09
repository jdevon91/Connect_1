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
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBAction func signInBtn(_ sender: Any) {
        
        if let email = emailField.text, let pwd = passwordField.text {
            FIRAuth.auth()?.signIn(withEmail: email, password: pwd, completion: { (user, error) in
                if error == nil {
                    print("Jesse: email user authenticated w/Firebase")
                }
                else {
                    FIRAuth.auth()?.createUser(withEmail: email, password: pwd, completion: { (user, error) in
                        if error != nil {
                            print("Jesse: email user not authenticated w/Firebase ")
                        }
                        else{
                            print("Jesse: email user authenticated w/Firebase")
                        }
                    })
                }
            })
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
}
