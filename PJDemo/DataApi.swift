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
    
    // MARK: power consume
    
    static func consumeDayData(success: (NSDictionary) -> Void) {
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
    
    static func consumeMonthData(success: (NSDictionary) -> Void) {
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
    
    static func consumeYearData(success: (NSDictionary) -> Void) {
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
    
    // MARK: power generate
    
    static func generateDayData(success: (NSDictionary) -> Void) {
        let urlString = urlSchema.stringByAppendingString(kGenrate_Day_Data)
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
    
    static func generateMonthData(success: (NSDictionary) -> Void) {
        let urlString = urlSchema.stringByAppendingString(kGenrate_Month_Data)
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
    
    static func generateYearData(success: (NSDictionary) -> Void) {
        let urlString = urlSchema.stringByAppendingString(kGenrate_Year_Data)
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