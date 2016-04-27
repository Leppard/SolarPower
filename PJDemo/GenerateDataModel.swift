//
//  GenerateDataModel.swift
//  PJDemo
//
//  Created by Leppard on 4/27/16.
//  Copyright © 2016 apple. All rights reserved.
//

import Foundation

struct GenerateHourItem {
    var time: NSString
    var value: NSString
    init(time: NSString, value: NSString) {
        self.time = time
        self.value = value
    }
}

struct GenerateDayItem {
    var total: NSString
    var dataList: [GenerateHourItem]
    
    init(dayTotal: NSString, hoursList: [GenerateHourItem]) {
        self.total = dayTotal
        self.dataList = hoursList
    }
}

struct GenerateMonthItem {
    var total: NSString
    var dataList: [GenerateDayItem]
    
    init(total: NSString, dataList: [GenerateDayItem]) {
        self.total = total
        self.dataList = dataList
    }
}

struct GenerateSeasonItem {
    var total: NSString
    var dataList: [GenerateMonthItem]
    
    init(total: NSString, dataList: [GenerateMonthItem]) {
        self.total = total
        self.dataList = dataList
    }
}

struct GenerateYearItem {
    var total: NSString
    var dataList: [GenerateMonthItem]
    
    init(total: NSString, dataList: [GenerateMonthItem]) {
        self.total = total
        self.dataList = dataList
    }
}

