//
//  ChartsViewController.swift
//  PJDemo
//
//  Created by apple on 16/1/14.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit
import Charts

class ConsumeViewController: UIViewController, ChartViewDelegate {
    
    @IBOutlet weak var lineChartView: LineChartView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    let currentDate = NSDate()
    let dateFormatter = NSDateFormatter()
    
    var dailyData: DataGroup = DataGroup()
    var monthlyData: DataGroup = DataGroup()
    var yearlyData: DataGroup = DataGroup()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lineChartView.delegate = self
        
        self.lineChartView.leftAxis.labelPosition = .OutsideChart
        self.lineChartView.descriptionText = ""
        
        self.segmentControl.addTarget(self, action: #selector(ConsumeViewController.segmentControlIndexChanged), forControlEvents: .ValueChanged)
        
        self.segmentControl.selectedSegmentIndex = 0;
        self.segmentControlIndexChanged()
    }
    
    func segmentControlIndexChanged() {
        
        self.activityIndicator.startAnimating()
        self.activityIndicator.hidden = false
        self.lineChartView.hidden = true
        
        switch self.segmentControl.selectedSegmentIndex{
        case 0:
            DataApi.consumeTotalDayData({ (data: NSDictionary) -> Void in
                self.dailyData = DataGroup.init(dictionary: data)
                var xArray: [String] = []
                var yArray: [Double] = []
                for DataItem in self.dailyData.list {
                    xArray.append(DataItem.time)
                    yArray.append(DataItem.value)
                }
                
                DataApi.consumeTotalDayData(<#T##success: (NSDictionary) -> Void##(NSDictionary) -> Void#>)
                //                drawMultiLineCharts(self.lineChartView, dataPoints: xArray, values: [unitsData_daily1,unitsData_daily2], lineColor:[consumeColor, UIColor.lightGrayColor()], labels:["总耗","空调"])
                drawMultiLineCharts(self.lineChartView, dataPoints: xArray, values: [yArray], lineColor:[consumeColor], labels:["总耗"])
                
                self.activityIndicator.stopAnimating()
                self.activityIndicator.hidden = true
                self.lineChartView.hidden = false
            })
        
        case 1:
            DataApi.consumeTotalMonthData({ (data: NSDictionary) -> Void in
                self.monthlyData = DataGroup.init(dictionary: data)
                var xArray: [String] = []
                var yArray: [Double] = []
                for DataItem in self.monthlyData.list {
                    xArray.append(DataItem.time)
                    yArray.append(DataItem.value)
                }
                //                drawMultiLineCharts(self.lineChartView, dataPoints: xArray, values: [unitsData_daily1,unitsData_daily2], lineColor:[consumeColor, UIColor.lightGrayColor()], labels:["总耗","空调"])
                drawMultiLineCharts(self.lineChartView, dataPoints: xArray, values: [yArray], lineColor:[consumeColor], labels:["总耗"])
                
                self.activityIndicator.stopAnimating()
                self.activityIndicator.hidden = true
                self.lineChartView.hidden = false
            })
            
        case 2:
            DataApi.consumeTotalYearData({ (data: NSDictionary) -> Void in
                self.yearlyData = DataGroup.init(dictionary: data)
                var xArray: [String] = []
                var yArray: [Double] = []
                for DataItem in self.yearlyData.list {
                    xArray.append(DataItem.time)
                    yArray.append(DataItem.value)
                }
                //                drawMultiLineCharts(self.lineChartView, dataPoints: xArray, values: [unitsData_daily1,unitsData_daily2], lineColor:[consumeColor, UIColor.lightGrayColor()], labels:["总耗","空调"])
                drawMultiLineCharts(self.lineChartView, dataPoints: xArray, values: [yArray], lineColor:[consumeColor], labels:["总耗"])
                
                self.activityIndicator.stopAnimating()
                self.activityIndicator.hidden = true
                self.lineChartView.hidden = false
            })
        default : break
        }
    }
    
    func setChart(dataPoints : [String],values: [Double]){
        var dataEntries : [ChartDataEntry] = []
        for i in 0 ..< dataPoints.count{
            let dataEntry = ChartDataEntry(value: values[i], xIndex: i)
            dataEntries.append(dataEntry)
        }
        
        let lineChartDataSet = LineChartDataSet(yVals: dataEntries, label: "Unit Sold")
        setChartLineData(lineChartDataSet, color: UIColor.darkGrayColor())
        let lineChartData = LineChartData(xVals: dataPoints, dataSet: lineChartDataSet)
        lineChartData.setValueTextColor(UIColor.darkGrayColor())
        lineChartView.data = lineChartData
       
    }
    
    func setChartLineData(set: LineChartDataSet, color: UIColor)
    {
        let lineColor = color.colorWithAlphaComponent(0.5)
        set.setColor(lineColor)
        set.setCircleColor(color)
        set.lineWidth = 2.0
        set.circleRadius = 4.0
        set.fillAlpha = 65 / 255.0
        set.fillColor = color
        set.highlightColor = UIColor.whiteColor()
        set.drawCircleHoleEnabled = true
    }
}
