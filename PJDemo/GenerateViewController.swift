//
//  GenerateViewController.swift
//  PJDemo
//
//  Created by apple on 16/4/27.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit
import Charts

class GenerateViewController: UIViewController {
    
    @IBOutlet weak var substituteButton: UIButton!
    @IBOutlet weak var compareButton: UIButton!

    @IBOutlet weak var barChartView: BarChartView!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    var dailyData: DataGroup = DataGroup()
    var monthlyData: DataGroup = DataGroup()
    var yearlyData: DataGroup = DataGroup()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        compareButton.layer.cornerRadius = 4
        substituteButton.layer.cornerRadius = 4
        
        self.barChartView.leftAxis.labelPosition = .OutsideChart
        self.barChartView.descriptionText = ""
        
        self.segmentControl.addTarget(self, action: #selector(GenerateViewController.segmentControlIndexChanged), forControlEvents: .ValueChanged)
        self.segmentControl.selectedSegmentIndex = 0;
        self.segmentControlIndexChanged()
    }
    
    func segmentControlIndexChanged() {
        
        self.activityIndicator.startAnimating()
        self.activityIndicator.hidden = false
        self.barChartView.hidden = true
        
        switch self.segmentControl.selectedSegmentIndex{
        case 0:
            DataApi.generateDayData({ (data: NSDictionary) -> Void in
                self.dailyData = DataGroup.init(dictionary: data)
                var xArray: [String] = []
                var yArray: [Double] = []
                for DataItem in self.dailyData.list {
                    xArray.append(DataItem.time)
                    yArray.append(DataItem.value)
                }
                drawMultiBarCharts(self.barChartView, dataPoints: xArray, values: [yArray], barColor: [generateColor], labels:["发电"])
                
                self.activityIndicator.stopAnimating()
                self.activityIndicator.hidden = true
                self.barChartView.hidden = false
            })
            
        case 1:
            DataApi.generateMonthData({ (data: NSDictionary) -> Void in
                self.monthlyData = DataGroup.init(dictionary: data)
                var xArray: [String] = []
                var yArray: [Double] = []
                for DataItem in self.monthlyData.list {
                    xArray.append(DataItem.time)
                    yArray.append(DataItem.value)
                }
                drawMultiBarCharts(self.barChartView, dataPoints: xArray, values: [yArray], barColor: [generateColor], labels:["发电"])
                
                self.activityIndicator.stopAnimating()
                self.activityIndicator.hidden = true
                self.barChartView.hidden = false
            })
            
        case 2:
            DataApi.generateYearData({ (data: NSDictionary) -> Void in
                self.yearlyData = DataGroup.init(dictionary: data)
                var xArray: [String] = []
                var yArray: [Double] = []
                for DataItem in self.yearlyData.list {
                    xArray.append(DataItem.time)
                    yArray.append(DataItem.value)
                }
                drawMultiBarCharts(self.barChartView, dataPoints: xArray, values: [yArray], barColor: [generateColor], labels:["发电"])
                
                self.activityIndicator.stopAnimating()
                self.activityIndicator.hidden = true
                self.barChartView.hidden = false
            })
        default : break
        }
    }

}
