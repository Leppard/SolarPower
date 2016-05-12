//
//  QueryGenerateViewController.swift
//  PJDemo
//
//  Created by Leppard on 5/12/16.
//  Copyright © 2016 apple. All rights reserved.
//

import Foundation

import UIKit
import Charts

class QueryGenerateViewController: UIViewController, ChartViewDelegate {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var barChartView: BarChartView!
    @IBOutlet weak var pickerView: UIPickerView!
    
    let dateArray: [[String]] = [["2010", "2011", "2012", "2013", "2014", "2015", "2016"], ["--", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"], ["--", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.barChartView.delegate = self
        self.activityIndicator.color = UIColor.grayColor()
        self.activityIndicator.hidden = true
        
        self.barChartView.leftAxis.labelPosition = .OutsideChart
        self.barChartView.descriptionText = ""
    }


    @IBAction func startQuery(sender: AnyObject) {
        self.activityIndicator.startAnimating()
        self.activityIndicator.hidden = false
        self.barChartView.hidden = true
        
        var dateString = ""
        for i in 0..<dateArray.count {
            let str = dateArray[i][self.pickerView.selectedRowInComponent(i)]
            if (str == "--") {
                continue
            }
            dateString = dateString.stringByAppendingString(str+"/")
        }
        DataApi.queryGenerateTotalData(dateString, success: { (data: NSDictionary) -> Void in
            let totalData = DataGroup.init(dictionary: data)
            var xArray: [String] = []
            var yArray: [Double] = []
            for DataItem in totalData.list {
                xArray.append(DataItem.time)
                yArray.append(DataItem.value)
            }
            drawMultiBarCharts(self.barChartView, dataPoints: xArray, values: [yArray], barColor: [generateColor], labels:["发电"])
            
            self.activityIndicator.stopAnimating()
            self.activityIndicator.hidden = true
            self.barChartView.hidden = false
        })

    }
}

extension QueryGenerateViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return self.dateArray.count
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.dateArray[component].count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.dateArray[component][row]
    }
}
