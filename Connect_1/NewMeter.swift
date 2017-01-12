//
//  NewMeter.swift
//  Connect_1
//
//  Created by Jesse Budhlall on 2017-01-10.
//  Copyright © 2017 Jesse Budhlall. All rights reserved.
//

import UIKit
import Foundation
import Alamofire

class NewMeter: UIViewController {
    
    let userLatitude = Location.sharedInstance.latitude
    let userLongitude = Location.sharedInstance.longitude
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil) // kills the current view controller
    }
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var provStatTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var latitudeTextField: UITextField!
    @IBOutlet weak var longitudeTextField: UITextField!
    @IBOutlet weak var ipAddressTextField: UITextField!
    @IBOutlet weak var portTextField: UITextField!
    @IBOutlet weak var slaveIdTextfield: UITextField!
    @IBOutlet weak var serviceCarrierTextField: UITextField!
    @IBAction func addMeterButton(_ sender: Any) {
        let addParameters: Parameters = [
            "Location_Name": locationTextField.text!,
            "Address":addressTextField.text!,
            "Prov_State": provStatTextField.text!,
            "Country": countryTextField.text!,
            "Latitude": latitudeTextField.text!,
            "Longitude": longitudeTextField.text!,
            "IP_Address": ipAddressTextField.text!,
            "Port": portTextField.text!,
            "Slave_ID": slaveIdTextfield.text!,
            "Carrier": serviceCarrierTextField.text!
        ]
        Alamofire.request("http://connect.medeng.com/submitmeter.php",method: .post, parameters: addParameters)
        
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
        
        latitudeTextField.text = "\(userLatitude!)"
        longitudeTextField.text = "\(userLongitude!)"
        super.viewDidLoad()
    }
}
