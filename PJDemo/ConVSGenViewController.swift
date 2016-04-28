//
//  ConVSGenViewController.swift
//  PJDemo
//
//  Created by apple on 16/4/27.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit
import Charts

class ConVSGenViewController: UIViewController {

    let consume_v_generate = ["1","2","3","4","5","6","7"]
    let consume_data = [3.0 , 6.6 , 7.9 , 4.7 , 9.7 , 3.6 , 2.0]
    let generate_value = [2.5 , 6.9, 4.1, 10.0 , 3.9, 9.0 , 5.0 ]
    
    @IBAction func indexChanged(sender: AnyObject) {
    }
    @IBOutlet weak var barChartView: BarChartView!
    override func viewDidLoad() {
        super.viewDidLoad()
        drawMultiBarCharts(barChartView,dataPoints: consume_v_generate, values: [consume_data,generate_value], barColor: [consumeColor, generateColor],labels: ["耗电","发电"])
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
