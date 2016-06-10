//
//  DataApi.swift
//  PJDemo
//
//  Created by Leppard on 4/28/16.
//  Copyright © 2016 apple. All rights reserved.
//

import Foundation
import Alamofire

let urlSchema = "http://192.168.0.122:7777"

let needFakeData: Bool = true

class DataApi {
    
    static let date = NSDate()
    static let dateFormatter = NSDateFormatter()
    
    // MARK: power consume
    // MARK: Total
    
    static func consumeTotalDayData(success: (NSDictionary) -> Void) {
        self.dateFormatter.dateFormat = "yyyy/MM/dd"
        
        let urlString = kCONSUME_TOTAL.stringByAppendingString(needFakeData ? "2015/10/01" : dateFormatter.stringFromDate(self.date))
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
    
    static func consumeTotalMonthData(success: (NSDictionary) -> Void) {
        self.dateFormatter.dateFormat = "yyyy/MM"
        let urlString = kCONSUME_TOTAL.stringByAppendingString(needFakeData ? "2015/10" : dateFormatter.stringFromDate(self.date))
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
    
    static func consumeTotalYearData(success: (NSDictionary) -> Void) {
        self.dateFormatter.dateFormat = "yyyy"
        let urlString = kCONSUME_TOTAL.stringByAppendingString(needFakeData ? "2015" : dateFormatter.stringFromDate(self.date))
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
    
    static func queryConsumeTotalData(date: String , success: (NSDictionary) -> Void) {
        let urlString = kCONSUME_TOTAL.stringByAppendingString(date)
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
    
    // MARK: Aircondition
    
    static func consumeAirDayData(success: (NSDictionary) -> Void) {
        self.dateFormatter.dateFormat = "yyyy/MM/dd"
        let urlString = kCONSUME_AIR.stringByAppendingString(needFakeData ? "2015/10/01" : dateFormatter.stringFromDate(self.date))
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
    
    static func consumeAirMonthData(success: (NSDictionary) -> Void) {
        self.dateFormatter.dateFormat = "yyyy/MM"
        let urlString = kCONSUME_AIR.stringByAppendingString(needFakeData ? "2015/10" : dateFormatter.stringFromDate(self.date))
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
    
    static func consumeAirYearData(success: (NSDictionary) -> Void) {
        self.dateFormatter.dateFormat = "yyyy"
        let urlString = kCONSUME_AIR.stringByAppendingString(needFakeData ? "2015" : dateFormatter.stringFromDate(self.date))
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
    
    static func queryConsumeAirData(date: String , success: (NSDictionary) -> Void) {
        let urlString = kCONSUME_AIR.stringByAppendingString(date)
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
    // MARK: Total
    
    static func generateTotalDayData(success: (NSDictionary) -> Void) {
        self.dateFormatter.dateFormat = "yyyy/MM/dd"
        let urlString = kGENERATE_TOTAL.stringByAppendingString(needFakeData ? "2015/10/01" : dateFormatter.stringFromDate(self.date))
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
    
    static func generateTotalMonthData(success: (NSDictionary) -> Void) {
        self.dateFormatter.dateFormat = "yyyy/MM"
        let urlString = kGENERATE_TOTAL.stringByAppendingString(needFakeData ? "2015/10" : dateFormatter.stringFromDate(self.date))
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
    
    static func generateTotalYearData(success: (NSDictionary) -> Void) {
        self.dateFormatter.dateFormat = "yyyy"
        let urlString = kGENERATE_TOTAL.stringByAppendingString(needFakeData ? "2015" : dateFormatter.stringFromDate(self.date))
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
    
    static func queryGenerateTotalData(date: String , success: (NSDictionary) -> Void) {
        let urlString = kGENERATE_TOTAL.stringByAppendingString(date)
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
    
    // MARK: Weather
    
    static func getWeatherData(success: (NSDictionary) -> Void) {
        self.dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let urlString = kWEATHER.stringByAppendingString(dateFormatter.stringFromDate(self.date)).stringByAppendingString("/%E4%B8%8A%E6%B5%B7")
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