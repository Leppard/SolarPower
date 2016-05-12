//
//  DashboardViewController.swift
//  PJDemo
//
//  Created by Leppard on 5/12/16.
//  Copyright © 2016 apple. All rights reserved.
//

import UIKit
import Charts

class DashboardViewController: UIViewController {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var generateLineChartView: LineChartView!
    @IBOutlet weak var consumeLineChartView: LineChartView!
    
    @IBOutlet weak var generateSpinningView: SpinningView!
    @IBOutlet weak var earnSpinningView: SpinningView!
    @IBOutlet weak var dayGenerateSpinningView: SpinningView!
    @IBOutlet weak var dayEarnSpinningView: SpinningView!
    
    let date = NSDate()
    let dateFormatter = NSDateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dateFormatter.dateFormat = "yyyy-MM-dd"
        self.dateLabel.text = dateFormatter.stringFromDate(date)
        
        self.tempLabel.text = ""
        
        self.activityIndicator.color = UIColor.grayColor()
        self.activityIndicator.startAnimating()
        self.activityIndicator.hidden = false
        self.consumeLineChartView.hidden = true
        self.generateLineChartView.hidden = true
        
//        DataApi.getWeatherData({(NSDictionary) -> Void in
//            更新温度label
//        })
        
        self.generateSpinningView.updateAnimation(0.65, color: UIColor.greenColor())
        self.earnSpinningView.updateAnimation(0.4, color: UIColor.orangeColor())
        self.dayGenerateSpinningView.updateAnimation(0.8, color: UIColor.init(red: 0/255.0, green: 204/255.0, blue: 204/255.0, alpha: 1))
        self.dayEarnSpinningView.updateAnimation(0.2, color: UIColor.redColor())
        
        DataApi.queryConsumeTotalData("2015/10/01", success: {(data: NSDictionary) -> Void in
            let totalData = DataGroup.init(dictionary: data)
            var consumeXCor: [String] = []
            var consumeYCor: [Double] = []
            for DataItem in totalData.list {
                consumeXCor.append(DataItem.time)
                consumeYCor.append(DataItem.value)
            }
            DataApi.queryGenerateTotalData("2015/10/01", success: {(data: NSDictionary) -> Void in
                let totalData = DataGroup.init(dictionary: data)
                var generateXCor: [String] = []
                var generateYCor: [Double] = []
                for DataItem in totalData.list {
                    generateXCor.append(DataItem.time)
                    generateYCor.append(DataItem.value)
                }
                
                drawSingleLineChart(self.consumeLineChartView, dataPoints: consumeXCor, values: consumeYCor, color: consumeColor)
                drawSingleLineChart(self.generateLineChartView, dataPoints: generateXCor, values: generateYCor, color: UIColor.cyanColor())
                
                self.activityIndicator.stopAnimating()
                self.activityIndicator.hidden = true
                self.consumeLineChartView.hidden = false
                self.generateLineChartView.hidden = false
            })
        })
    }
    

}
