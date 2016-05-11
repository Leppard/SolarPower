//
//  GlobalConstants.swift
//  PJDemo
//
//  Created by Leppard on 4/28/16.
//  Copyright © 2016 apple. All rights reserved.
//

import Foundation

// MARK: color
let consumeColor: UIColor = UIColor.init(red: 253/255.0, green: 156/255.0, blue: 55/255.0, alpha: 1.0)
let alertColor: UIColor = UIColor.init(red: 244/255.0, green: 67/255.0, blue: 54/255.0, alpha: 1.0)
let generateColor: UIColor = UIColor.init(red: 139/255.0, green: 195/255.0, blue: 74/255.0, alpha: 1.0)
let efficiencyColor: UIColor = UIColor.init(red: 0/255.0, green: 188/255.0, blue: 212/255.0, alpha: 1.0)

// MARK: URL
let kCONSUME_TOTAL = "/TAN/powerconsumption/"

let kCONSUME_AIR = "/TAN/powerconsumption/airconditioning/"

let kGENERATE_TOTAL = "/TAN/powergeneration/"

let kWEATHER_SHANGHAI = "/weather/2016-04-28/上海"

// MARK: Global Variables
var yearConsume: Double = 0.0
var yearGenerate: Double = 0.0