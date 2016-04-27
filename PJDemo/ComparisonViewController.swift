//
//  ComparisonViewController.swift
//  PJDemo
//
//  Created by apple on 16/4/27.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit
import Charts

class ComparisonViewController: UIViewController {
    
    
    
    let value = [6.9,86.7,66.7]
    
    let dataPoints = ["Jun" , "May", "Apr"]

    @IBOutlet weak var comparisonView: HorizontalBarChartView!
    override func viewDidLoad() {
        super.viewDidLoad()
        comparisonView.xAxis.labelPosition = .Bottom
        comparisonView.gridBackgroundColor = UIColor.whiteColor()
        
        drawHorizontalBarCharts(comparisonView, dataPoints: dataPoints, values: value)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
