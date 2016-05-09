//
//  DataApi.swift
//  PJDemo
//
//  Created by Leppard on 4/28/16.
//  Copyright © 2016 apple. All rights reserved.
//

import Foundation
import Alamofire

let urlSchema = "http://15013vr175.imwork.net:7777"

class DataApi {
    static func getDayData(success: (NSDictionary) -> Void) {
        let urlString = urlSchema.stringByAppendingString(kConsume_Day_Data)
        let params = ["Content-type": "application/json", ]
        Alamofire.request(.GET, urlString, parameters: params)
            .responseJSON { response in
                switch response.result {
                case .Success:
                    if let value = response.result.value as? [String: AnyObject] {
                        success(value)
                    }
                    break
                case .Failure:
                    break
                }
        }
    }
    
    static func getMonthData(success: (NSDictionary) -> Void) {
        let urlString = urlSchema.stringByAppendingString(kConsume_Month_Data)
        let params = ["Content-type": "application/json", ]
        Alamofire.request(.GET, urlString, parameters: params)
            .responseJSON { response in
                switch response.result {
                case .Success:
                    if let value = response.result.value as? [String: AnyObject] {
                        success(value)
                    }
                    break
                case .Failure:
                    break
                }
        }
    }
    
    static func getYearData(success: (NSDictionary) -> Void) {
        let urlString = urlSchema.stringByAppendingString(kConsume_Year_Data)
        let params = ["Content-type": "application/json", ]
        Alamofire.request(.GET, urlString, parameters: params)
            .responseJSON { response in
                switch response.result {
                case .Success:
                    if let value = response.result.value as? [String: AnyObject] {
                        success(value)
                    }
                    break
                case .Failure:
                    break
                }
        }
    }
}