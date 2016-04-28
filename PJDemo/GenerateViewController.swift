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
    var daily = ["01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24"]
    
    let unitsData_daily1 = [20.0, 4.0, 6.0, 3.0, 12.0, 1.0,2.0, 14.0, 3.0, 7.0, 9.0, 4.0,5.0, 2.0, 6.0, 13.0, 2.0,8.0,10.0, 14.0, 9.0, 3.0, 12.0, 16.0]
    
    @IBAction func indexChanged(sender: AnyObject) {
    }

    @IBOutlet weak var barChartView: BarChartView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    drawMultiBarCharts(barChartView, dataPoints: daily, values: [unitsData_daily1], barColor: [generateColor], labels:["发电"])
        compareButton.layer.cornerRadius = 4
        substituteButton.layer.cornerRadius = 4
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
