//
//  MeterID.swift
//  Connect_1
//
//  Created by Jesse Budhlall on 2016-12-27.
//  Copyright © 2016 Jesse Budhlall. All rights reserved.
//

import UIKit
import Alamofire

class MeterID: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var TextEntry: UITextField!
    @IBAction func ConnectPushed(_ sender: Any) {

        //passing textfield to a string then passing the string through segue
        let UserEnteredMeterID: String = TextEntry.text!
        let callFromConstants = Constants()
        callFromConstants.updateMeterUrl(meter_url: UserEnteredMeterID)
        performSegue(withIdentifier: "toMeterConnect", sender: UserEnteredMeterID)
        Alamofire.request("http://connect.medeng.com/standby.php?meter=\(self.TextEntry.text!)")
        
}
    @IBAction func MeterIdBackButtonPressed(_ sender: Any) {
        
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
  
self.TextEntry.delegate = self
    
}
}
