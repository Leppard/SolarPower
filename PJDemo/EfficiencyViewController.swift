//
//  EfficiencyViewController.swift
//  PJDemo
//
//  Created by apple on 16/4/27.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit
import Charts

class EfficiencyViewController: UIViewController {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var barChartView: BarChartView!
    
    let mode = ["0","1","2"]
    let data :[Double] = [20.0,40.0,15.0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.activityIndicator.color = UIColor.grayColor()
        self.activityIndicator.startAnimating()
        self.barChartView.hidden = true
        
        // get data via API
//        drawMultiBarCharts(barChartView, dataPoints: mode, values: [data], barColor: [efficiencyColor], labels: ["Efficiency"])
    }
}
