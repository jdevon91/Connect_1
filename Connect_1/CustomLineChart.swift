//
//  CustomLineChart.swift
//  Connect_1
//
//  Created by Jesse Budhlall on 2017-02-17.
//  Copyright © 2017 Jesse Budhlall. All rights reserved.
//

import Foundation
import Charts

enum CustomLineChartTypes {
    case SimpleLine
    case DetailedLine
}

class CustomLineChart: LineChartView {
    
    init(customChartType: CustomLineChartTypes, frame: CGRect) {
        super.init(frame: frame)
        self.configureSimpleLineChart()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configureDetailedLineChart()
    }
    
    func configureSimpleLineChart(){
        
        self.isUserInteractionEnabled = false
        self.noDataText = "No data provided"
        self.chartDescription?.text = ""
        self.legend.enabled = false
        self.rightAxis.enabled = false
        self.leftAxis.enabled = false
        self.xAxis.enabled = false
        self.minOffset = 0
    }
    
    func configureDetailedLineChart(){
        
        // General set up
        self.chartDescription?.textColor = UIColor.white
        self.backgroundColor = UIColor.white
        self.noDataText = "No data provided"
        self.chartDescription?.text = ""
        self.rightAxis.enabled = false
        self.lineData?.highlightEnabled = false
        self.borderLineWidth = 0
        self.drawGridBackgroundEnabled = false
        self.legend.enabled = false
        self.tintColor = UIColor.clear
        self.isUserInteractionEnabled = false
        
        // XAxis configuration
        let xAxisSet = self.xAxis
        xAxisSet.labelCount = 0
        xAxisSet.labelPosition = .bottomInside
        xAxisSet.labelTextColor = UIColor.clear
        xAxisSet.gridColor = UIColor.clear
        xAxisSet.axisLineColor = UIColor.clear
        
        // YAxis configuration
        let yAxisSetLeft = self.leftAxis
        yAxisSetLeft.labelPosition = .insideChart
        yAxisSetLeft.labelTextColor = UIColor.clear
        yAxisSetLeft.labelCount = 0
        yAxisSetLeft.zeroLineColor = UIColor.clear
        yAxisSetLeft.gridColor = UIColor.clear
        yAxisSetLeft.axisLineColor = UIColor.clear
    }
    
    func setLineChartData(animate: Bool, dataSet: [Double], timeDataSet: [Double], color: UIColor) {
        
        // Principle Values
        
        if animate {
            self.animate(xAxisDuration: 0.4)
        } else {
            self.animate(xAxisDuration: 0.0)
        }
        
        var yVals1 : [ChartDataEntry] = [ChartDataEntry]()
        for i in 0 ..< dataSet.count {
            yVals1.append(ChartDataEntry(x: dataSet[i], y: dataSet[i]))
        }
        
        let set1: LineChartDataSet = LineChartDataSet(values: yVals1, label: nil)
        set1.axisDependency = .left // Line will correlate with left axis values
        set1.setColor(color)
        set1.circleRadius = 0
        set1.circleHoleRadius = 0
        set1.lineWidth = 3
        set1.mode = .horizontalBezier
        
        var dataSets : [LineChartDataSet] = [LineChartDataSet]()
        dataSets.append(set1)
        
        let data: LineChartData = LineChartData(dataSets: dataSets)
        data.setDrawValues(false)
        self.data = data
    }
}
