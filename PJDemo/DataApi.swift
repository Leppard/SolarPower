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
        Alamofire.request(.GET, urlString, parameters: nil)
            .responseJSON { response in
                print(response.request)  // original URL request
                print(response.response) // URL response
                print(response.data)     // server data
                print(response.result)   // result of response serialization
        }
    }
}