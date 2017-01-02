//
//  MeterConnect.swift
//  Connect_1
//
//  Created by Jesse Budhlall on 2016-12-27.
//  Copyright © 2016 Jesse Budhlall. All rights reserved.
//

import UIKit

class MeterConnect: UIViewController {
    @IBOutlet weak var meterName: UILabel!
    @IBAction func meterConnectBackButtonPressed(_ sender: Any) {

            dismiss(animated: true, completion: nil) // kills the current view controller
    }
   
    private var _currentMeter: String!//local variable for current meter
    
    // get\ set
    var currentMeter: String {
        get {
            return _currentMeter
        } set {
            _currentMeter = newValue
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        meterName.text = _currentMeter

    }

    }

