//
//  ForgotPassword.swift
//  Connect_1
//
//  Created by Jesse Budhlall on 2017-02-23.
//  Copyright © 2017 Jesse Budhlall. All rights reserved.
//

import UIKit
import Firebase

class ForgotPassword: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBAction func sendEmailBtn(_ sender: Any) {
        if self.emailField.text == ""
        {
            let alertController = UIAlertController(title: "No email entered!", message: "Please enter an email.", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(defaultAction)
            
            self.present(alertController, animated: true, completion: nil)
        }
        else{
            
            FIRAuth.auth()?.sendPasswordReset(withEmail: self.emailField.text!, completion: { (error) in
               
                var title = ""
                var message = ""
                
                if error != nil {
                    
                    title = "Error!"
                    message = (error?.localizedDescription)!
                }
                else{
                    
                    title = "Success!"
                    message = "Password reset email sent."
                    self.emailField.text = ""
                }
                
                let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
                
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                
                alertController.addAction(defaultAction)
                
                self.present(alertController, animated: true, completion: nil)
            })
        }
        
    }
    
    @IBAction func backBtn(_ sender: Any) {
    
        dismiss(animated: true, completion: nil) // kills the current view controller
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
