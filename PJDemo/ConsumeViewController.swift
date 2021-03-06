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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lineChartView.delegate = self
        self.activityIndicator.color = UIColor.grayColor()
        
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
                let totalData = DataGroup.init(dictionary: data)
                var xArray: [String] = []
                var totalArray: [Double] = []
                for DataItem in totalData.list {
                    xArray.append(DataItem.time)
                    totalArray.append(DataItem.value)
                }
                DataApi.consumeAirDayData({ (data: NSDictionary) -> Void in
                    let airData = DataGroup.init(dictionary: data)
                    var airArray: [Double] = []
                    for DataItem in airData.list {
                        airArray.append(DataItem.value)
                    }
                    
                    drawMultiLineCharts(self.lineChartView, dataPoints: xArray, values: [totalArray, airArray], lineColor:[consumeColor, UIColor.cyanColor()], labels:["总耗", "空调"])
                    
                    self.activityIndicator.stopAnimating()
                    self.activityIndicator.hidden = true
                    self.lineChartView.hidden = false
                })
            })
        
        case 1:
            DataApi.consumeTotalMonthData({ (data: NSDictionary) -> Void in
                let monthlyData = DataGroup.init(dictionary: data)
                var xArray: [String] = []
                var totalArray: [Double] = []
                for DataItem in monthlyData.list {
                    xArray.append(DataItem.time)
                    totalArray.append(DataItem.value)
                }
                DataApi.consumeAirMonthData({ (data: NSDictionary) -> Void in
                    let dailyData = DataGroup.init(dictionary: data)
                    var airArray: [Double] = []
                    for DataItem in dailyData.list {
                        airArray.append(DataItem.value)
                    }
                    
                    drawMultiLineCharts(self.lineChartView, dataPoints: xArray, values: [totalArray, airArray], lineColor:[consumeColor, UIColor.cyanColor()], labels:["总耗", "空调"])
                    
                    self.activityIndicator.stopAnimating()
                    self.activityIndicator.hidden = true
                    self.lineChartView.hidden = false
                })
            })
            
        case 2:
            DataApi.consumeTotalYearData({ (data: NSDictionary) -> Void in
                let yearlyData = DataGroup.init(dictionary: data)
                var xArray: [String] = []
                var totalArray: [Double] = []
                for DataItem in yearlyData.list {
                    xArray.append(DataItem.time)
                    totalArray.append(DataItem.value)
                }
                DataApi.consumeAirYearData({ (data: NSDictionary) -> Void in
                    let dailyData = DataGroup.init(dictionary: data)
                    var airArray: [Double] = []
                    for DataItem in dailyData.list {
                        airArray.append(DataItem.value)
                    }
                    
                    drawMultiLineCharts(self.lineChartView, dataPoints: xArray, values: [totalArray, airArray], lineColor:[consumeColor, UIColor.cyanColor()], labels:["总耗", "空调"])
                    
                    self.activityIndicator.stopAnimating()
                    self.activityIndicator.hidden = true
                    self.lineChartView.hidden = false
                })
            })
            
        default : break
        }
    }
}
