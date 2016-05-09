//
//  SubstitueViewController.swift
//  PJDemo
//
//  Created by apple on 16/4/27.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit
import Charts

class SubstitueViewController: UIViewController {

    let substitute = ["发电","耗电"]
    
    let substituteDaily = [10.0,20.0]
    let substituteMonthly = [300.0, 250.1]
    let substitueYearly = [3200.9, 2400.0]
    
    @IBOutlet weak var dailyPieChartView: PieChartView!
    
    @IBOutlet weak var monthlyPieChartView: PieChartView!
    
    @IBOutlet weak var yearlyPieChartView: PieChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drawPieCharts(dailyPieChartView, dataPoints: substitute, values: substituteDaily, description : "Daily")
        drawPieCharts(monthlyPieChartView, dataPoints: substitute, values: substituteMonthly,description:"Monthly")
        drawPieCharts(yearlyPieChartView, dataPoints: substitute, values: substitueYearly, description : "Yearly")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}
