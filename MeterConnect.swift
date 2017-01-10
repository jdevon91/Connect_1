//
//  MeterConnect.swift
//  Connect_1
//
//  Created by Jesse Budhlall on 2016-12-27.
//  Copyright © 2016 Jesse Budhlall. All rights reserved.
//
import Foundation
import UIKit
import Alamofire

class MeterConnect: UIViewController {
    @IBOutlet weak var meterName: UILabel!
    @IBAction func meterConnectBackButtonPressed(_ sender: Any) {
        let getMeterID = MeterID.text
        Alamofire.request("http://connect.medeng.com/disconnect.php?meter=" + getMeterID!)
        //Alamofire.request("http://connect.medeng.com/disconnect.php?meter=2", method: .get )
        myTimer.invalidate()
        dismiss(animated: true, completion: nil) // kills the current view controller
    }
      @IBOutlet weak var MeterID: UILabel!
    @IBOutlet weak var Timestamp: UILabel!
    @IBOutlet weak var TestNumber: UILabel!
    @IBOutlet weak var PollFrequency: UILabel!
    @IBOutlet weak var TestControlStatus: UILabel!
    @IBOutlet weak var WaterCut: UILabel!
    @IBOutlet weak var GVF: UILabel!
    @IBOutlet weak var CurrentOilRate: UILabel!
    @IBOutlet weak var CurrentWaterRate: UILabel!
    @IBOutlet weak var CurrentGasRate: UILabel!
    @IBOutlet weak var Test_AVG_WC: UILabel!
    @IBOutlet weak var Test_AVG_GVF: UILabel!
    @IBOutlet weak var Cum_Oil: UILabel!
    @IBOutlet weak var Cum_Water: UILabel!
    @IBOutlet weak var Cum_Gas: UILabel!
    @IBAction func NewTestButton(_ sender: Any) {
        //passing meter ID to a string then passing the string through segue, this is also just segue control
        let LabelMeterID: String = MeterID.text!
        performSegue(withIdentifier: "toTestController", sender: LabelMeterID)

    }
    @IBAction func stopTestButton(_ sender: UIButton) {
        // create the alert
        let alert = UIAlertController(title: "End Current Test?", message: "Note: The application will email test results to the address given at the start of the test.", preferredStyle: UIAlertControllerStyle.alert)
        
        // add the actions (buttons)
        alert.addAction(UIAlertAction(title: "Stop Test", style: UIAlertActionStyle.default, handler: { action in
        
            // get request to stop test.
           Alamofire.request("http://connect.medeng.com/endtest.php/?testid=\(self.TestNumber.text!)")
            }))
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Stop Test & Email Report", style: UIAlertActionStyle.default, handler: { action in
            
            // get request to stop test.
            Alamofire.request("http://connect.medeng.com/endtest.php/?testid=\(self.TestNumber.text!)")
            
            // get request to send test report via email.
            Alamofire.request("http://connect.medeng.com/emailtest.php?testid=\(self.TestNumber.text!)")
        }))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
   
    private var _currentMeter: String!//local variable for current meter
    var currentMeter_2: CurrentMeterData!
    var myTimer = Timer()
  

    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentMeter_2 = CurrentMeterData()//init class
        //using the timer fucntion to loop call
        myTimer = Timer.scheduledTimer(timeInterval: 1.0,target: self, selector: #selector(runTimedCode),userInfo: nil, repeats: true)
     
    }
    //created a function to update the UI
    func updateMeterConnectUI() {
        
        MeterID.text = currentMeter_2.Meter_ID
        
        Timestamp.text = currentMeter_2.Timestamp
        
        TestNumber.text = currentMeter_2.Test_ID
        
        PollFrequency.text = currentMeter_2.Poll_Freq
        
        TestControlStatus.text = currentMeter_2.Test_Control
        
        WaterCut.text = currentMeter_2.Current_WC
        
        GVF.text = currentMeter_2.Current_GVF
        
        CurrentOilRate.text = currentMeter_2.Current_Oil_Rate
        
        CurrentWaterRate.text = currentMeter_2.Current_Water_Rate
        
        CurrentGasRate.text = currentMeter_2.Current_Gas_Rate
        
        Test_AVG_WC.text = currentMeter_2.Test_AVG_WC
        
        Test_AVG_GVF.text = currentMeter_2.Test_AVG_GVF
        
        Cum_Oil.text = currentMeter_2.Test_Cumulative_Oil
        
        Cum_Water.text = currentMeter_2.Test_Cumulative_Water
        
        Cum_Gas.text = currentMeter_2.Test_Cumulative_Gas
        
    }
    
    func runTimedCode(){
    
    self.currentMeter_2.downloadMeterDetails
    {
    
    self.updateMeterConnectUI() // calling update UI function
    
    }

    
    }

}

