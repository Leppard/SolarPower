//
//  DashboardViewController.swift
//  PJDemo
//
//  Created by Leppard on 5/12/16.
//  Copyright © 2016 apple. All rights reserved.
//

import UIKit
import Charts

class DashboardViewController: UIViewController, ChartViewDelegate {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var consumeLineChartView: LineChartView!
    
    @IBOutlet weak var generateSpinningView: SpinningView!
    @IBOutlet weak var earnSpinningView: SpinningView!
    @IBOutlet weak var dayGenerateSpinningView: SpinningView!
    @IBOutlet weak var dayEarnSpinningView: SpinningView!
    
    let date = NSDate()
    let dateFormatter = NSDateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.consumeLineChartView.delegate = self
        self.consumeLineChartView.leftAxis.labelPosition = .InsideChart
        self.consumeLineChartView.descriptionText = ""
        
        
        self.dateFormatter.dateFormat = "yyyy-MM-dd"
        self.dateLabel.text = dateFormatter.stringFromDate(date)
        
        self.tempLabel.text = ""
        
        self.activityIndicator.color = UIColor.grayColor()
        self.activityIndicator.startAnimating()
        self.activityIndicator.hidden = false
        self.consumeLineChartView.hidden = true
        
//        DataApi.getWeatherData({(NSDictionary) -> Void in
//            更新温度label
//        })
        
        self.generateSpinningView.updateAnimation(1, color: UIColor.greenColor())
        self.generateSpinningView.centerLabel.text = "330.0KW/h"
        
        self.earnSpinningView.updateAnimation(1, color: UIColor.orangeColor())
        self.earnSpinningView.centerLabel.text = "144.0元"
        
        self.dayGenerateSpinningView.updateAnimation(1, color: UIColor.init(red: 0/255.0, green: 204/255.0, blue: 204/255.0, alpha: 1))
        self.dayGenerateSpinningView.centerLabel.text = "1.2KW/h"
        
        self.dayEarnSpinningView.updateAnimation(1, color: UIColor.redColor())
        self.dayEarnSpinningView.centerLabel.text = "0.48元"
        
        DataApi.queryConsumeTotalData("2015/11/03", success: {(data: NSDictionary) -> Void in
            let totalData = DataGroup.init(dictionary: data)
            var consumeXCor: [String] = []
            var consumeYCor: [Double] = []
            for DataItem in totalData.list {
                consumeXCor.append(DataItem.time)
                consumeYCor.append(DataItem.value)
            }
            DataApi.queryGenerateTotalData("2015/11/03", success: {(data: NSDictionary) -> Void in
                let totalData = DataGroup.init(dictionary: data)
                var generateXCor: [String] = []
                var generateYCor: [Double] = []
                for DataItem in totalData.list {
                    generateXCor.append(DataItem.time)
                    generateYCor.append(DataItem.value)
                }
                var weather = "上海"
                DataApi.getWeatherData( {(data:
                    NSDictionary) -> Void in
                    let min: String? = (data.objectForKey("minTemperature") as? String)
                    let max: String? = (data.objectForKey("maxTemperature") as? String)
                    let wind: String? = (data.objectForKey("windDescription") as? String)
                    let desc: String? = (data.objectForKey("weatherDescription") as? String)
                    if let str = min {
                        weather = weather.stringByAppendingString(str + "~")
                        weather = weather.stringByAppendingString(max! + " ")
                        weather = weather.stringByAppendingString(wind! + " ")
                        weather = weather.stringByAppendingString(desc!)
                    }
                    
                    drawMultiLineCharts(self.consumeLineChartView, dataPoints: consumeXCor, values: [consumeYCor, generateYCor], lineColor:[consumeColor, UIColor.cyanColor()], labels:["今日耗电", "今日发电"])
                    
                    self.tempLabel.text = weather
                    
                    self.activityIndicator.stopAnimating()
                    self.activityIndicator.hidden = true
                    self.consumeLineChartView.hidden = false
                })
                
//                drawMultiLineCharts(self.consumeLineChartView, dataPoints: consumeXCor, values: [consumeYCor, generateYCor], lineColor:[consumeColor, UIColor.cyanColor()], labels:["今日耗电", "今日发电"])
//                
//                self.tempLabel.text = "19~23°C 无持续风向微风 多云"
//                
//                self.activityIndicator.stopAnimating()
//                self.activityIndicator.hidden = true
//                self.consumeLineChartView.hidden = false
            })
        })
    }
    

}
