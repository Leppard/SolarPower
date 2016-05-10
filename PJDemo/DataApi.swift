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
    
    static let date = NSDate()
    static let dateFormatter = NSDateFormatter()
    
    // MARK: power consume
    
    static func consumeDayData(success: (NSDictionary) -> Void) {
        self.dateFormatter.dateFormat = "yyyy/MM/dd"
        let urlString = kCONSUME_TOTAL.stringByAppendingString(dateFormatter.stringFromDate(self.date))
        let fullUrlString = urlSchema.stringByAppendingString(urlString)
        let params = ["Content-type": "application/json", ]
        Alamofire.request(.GET, fullUrlString, parameters: params)
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
        self.dateFormatter.dateFormat = "yyyy/MM"
        let urlString = kCONSUME_TOTAL.stringByAppendingString(dateFormatter.stringFromDate(self.date))
        let fullUrlString = urlSchema.stringByAppendingString(urlString)
        let params = ["Content-type": "application/json", ]
        Alamofire.request(.GET, fullUrlString, parameters: params)
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
        self.dateFormatter.dateFormat = "yyyy"
        let urlString = kCONSUME_TOTAL.stringByAppendingString(dateFormatter.stringFromDate(self.date))
        let fullUrlString = urlSchema.stringByAppendingString(urlString)
        let params = ["Content-type": "application/json", ]
        Alamofire.request(.GET, fullUrlString, parameters: params)
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
        self.dateFormatter.dateFormat = "yyyy/MM/dd"
        let urlString = kGENERATE_TOTAL.stringByAppendingString(dateFormatter.stringFromDate(self.date))
        let fullUrlString = urlSchema.stringByAppendingString(urlString)
        let params = ["Content-type": "application/json", ]
        Alamofire.request(.GET, fullUrlString, parameters: params)
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
        self.dateFormatter.dateFormat = "yyyy/MM"
        let urlString = kGENERATE_TOTAL.stringByAppendingString(dateFormatter.stringFromDate(self.date))
        let fullUrlString = urlSchema.stringByAppendingString(urlString)
        let params = ["Content-type": "application/json", ]
        Alamofire.request(.GET, fullUrlString, parameters: params)
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
        self.dateFormatter.dateFormat = "yyyy"
        let urlString = kGENERATE_TOTAL.stringByAppendingString(dateFormatter.stringFromDate(self.date))
        let fullUrlString = urlSchema.stringByAppendingString(urlString)
        let params = ["Content-type": "application/json", ]
        Alamofire.request(.GET, fullUrlString, parameters: params)
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