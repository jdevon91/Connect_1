//
//  chartViewController.swift
//  Connect_1
//
//  Created by Jesse Budhlall on 2017-02-13.
//  Copyright © 2017 Jesse Budhlall. All rights reserved.
//

import UIKit
import Charts
import Foundation

class chartViewController: UIViewController {
 
    
    @IBOutlet weak var lineChartView: CustomLineChart!
    @IBAction func backBtn(_ sender: Any) {
         dismiss(animated: true, completion: nil) // kills the current view controller
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    lineChartView.noDataText = "You need to provide data for the chart."
    CustomLineChart.configureDetailedLineChart(lineChartView)()
    let trialData = [1.0,2.0,3.0,4.0]
        let timeData = [1.0,2.0,3.0,4.0]
        
        lineChartView.setLineChartData(animate: false, dataSet: trialData, timeDataSet: timeData, color: UIColor.purple)
   
    }
}
