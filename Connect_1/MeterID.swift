//
//  MeterID.swift
//  Connect_1
//
//  Created by Jesse Budhlall on 2016-12-27.
//  Copyright © 2016 Jesse Budhlall. All rights reserved.
//

import UIKit

class MeterID: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var TextEntry: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
self.TextEntry.delegate = self
        // Do any additional setup after loading the view.
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    


}
