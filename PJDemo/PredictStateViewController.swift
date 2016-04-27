//
//  PredictStateViewController.swift
//  PJDemo
//
//  Created by apple on 16/4/27.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

class PredictStateViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        textView.text =
        "利用光伏发电系统历史发电数据，太阳辐照度数据和气象数据建立多元多项式回归模型，然后建立以气温为输入变量的预测模型。\n" +
        "P = -1.10730 - 0.00073 * T * H + 0.07630 * H - 0.00001 * H^2\n" +
        "太阳辐照度的变化具有动态性，多干扰性等特点，其中云量，大气状况，天气状况等因素的影响至关重要，由于天气预报并未提供统计方法所需要的太阳辐照度预报值，但在同一天气类型下，我们可以认为每天的有效太阳辐照度平均值近似相等。"
        
        
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
