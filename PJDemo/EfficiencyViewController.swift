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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.activityIndicator.color = UIColor.grayColor()
        self.activityIndicator.startAnimating()
        self.barChartView.hidden = true
        
        DataApi.consumeTotalYearData({ (data: NSDictionary) -> Void in
            let totalValue = DataGroup.init(dictionary: data).total
            
            DataApi.consumeAirYearData({ (data: NSDictionary) -> Void in
                let airValue = DataGroup.init(dictionary: data).total
                
                let otherValue = totalValue - airValue
                
                drawMultiBarCharts(self.barChartView, dataPoints: ["总能耗", "季节能耗", "非季节能耗"], values: [[totalValue, airValue, otherValue]], barColor: [efficiencyColor], labels: ["建筑能效"])
                
                self.activityIndicator.stopAnimating()
                self.activityIndicator.hidden = true
                self.barChartView.hidden = false
            })
        })


    }
}
