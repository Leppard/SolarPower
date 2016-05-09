//
//  DataModel.swift
//  PJDemo
//
//  Created by Leppard on 4/28/16.
//  Copyright © 2016 apple. All rights reserved.
//

import Foundation

struct DataItem {
    var time: String = ""
    var value: Double = 0.0
    
    init(dictionary: NSDictionary) {
        self.time = dictionary.objectForKey("time") as! String
        self.value = dictionary.objectForKey("value") as! Double
    }
}

struct DataGroup {
    var total: Double = 0.0
    var list: [DataItem] = []
    
    init(dictionary: NSDictionary) {
        self.total = dictionary.objectForKey("totalValue") as! Double
        let list: [NSDictionary] = dictionary.objectForKey("dataList") as! [NSDictionary]
        for item in list {
            self.list.append(DataItem.init(dictionary: item))
        }
    }
    init() {
        self.total = 0.0
        self.list = []
    }
}