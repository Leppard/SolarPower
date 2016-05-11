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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        compareButton.layer.cornerRadius = 4
        substituteButton.layer.cornerRadius = 4
        self.activityIndicator.color = UIColor.grayColor()
        
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
            DataApi.generateTotalDayData({ (data: NSDictionary) -> Void in
                let dailyData = DataGroup.init(dictionary: data)
                var xArray: [String] = []
                var yArray: [Double] = []
                for DataItem in dailyData.list {
                    xArray.append(DataItem.time)
                    yArray.append(DataItem.value)
                }
                
                drawMultiBarCharts(self.barChartView, dataPoints: xArray, values: [yArray], barColor: [generateColor], labels:["发电"])
                
                self.activityIndicator.stopAnimating()
                self.activityIndicator.hidden = true
                self.barChartView.hidden = false
            })
            
        case 1:
            DataApi.generateTotalMonthData({ (data: NSDictionary) -> Void in
                let monthlyData = DataGroup.init(dictionary: data)
                var xArray: [String] = []
                var yArray: [Double] = []
                for DataItem in monthlyData.list {
                    xArray.append(DataItem.time)
                    yArray.append(DataItem.value)
                }
                drawMultiBarCharts(self.barChartView, dataPoints: xArray, values: [yArray], barColor: [generateColor], labels:["发电"])
                
                self.activityIndicator.stopAnimating()
                self.activityIndicator.hidden = true
                self.barChartView.hidden = false
            })
            
        case 2:
            DataApi.generateTotalYearData({ (data: NSDictionary) -> Void in
                let yearlyData = DataGroup.init(dictionary: data)
                var xArray: [String] = []
                var yArray: [Double] = []
                for DataItem in yearlyData.list {
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
