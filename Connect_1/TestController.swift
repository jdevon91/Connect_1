//
//  TestController.swift
//  Connect_1
//
//  Created by Jesse Budhlall on 2017-01-03.
//  Copyright © 2017 Jesse Budhlall. All rights reserved.
//

import UIKit
import Foundation
import Alamofire

class TestController: UIViewController {
    @IBAction func TestControllerBackButtonPressed(_ sender: Any) {
         dismiss(animated: true, completion: nil) // kills the current view controller
    }
    @IBOutlet weak var MeterIDTextField: UITextField!
    @IBOutlet weak var PollRateTextField: UITextField!
    @IBOutlet weak var NameTextField: UILabel!
    @IBOutlet weak var NameTextField_: UITextField!
    @IBOutlet weak var CompanyTextField: UITextField!
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var CCTextField: UITextField!
    @IBOutlet weak var NotesTextField: UITextField!
    @IBAction func startTestButton(_ sender: Any) {
        let parameters: Parameters = [
            "METER": MeterIDTextField.text!,
            "POLLRATE":PollRateTextField.text!,
            "NAME": NameTextField_.text!,
            "COMPANY": CompanyTextField.text!,
            "EMAIL1": EmailTextField.text!,
            "EMAIL2": CCTextField.text!,
            "NOTES": NotesTextField.text!
        ]
        Alamofire.request("http://connect.medeng.com/submittest.php",method: .post, parameters: parameters)
        
        dismiss(animated: true, completion: nil) // kills the current view controller
    }
    
    //Hide keyboard when user touches outside keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //Hide keyboard when user hits return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return (true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        }
}
