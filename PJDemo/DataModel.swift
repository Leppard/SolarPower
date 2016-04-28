//
//  DataModel.swift
//  PJDemo
//
//  Created by Leppard on 4/28/16.
//  Copyright © 2016 apple. All rights reserved.
//

import Foundation

struct dataItem {
    var time: String = ""
    var value: String = ""
    init(time: String, value: String) {
        self.time = time
        self.value = value
    }
}

struct dataGroup {
    var total: String = ""
    var list: [dataItem] = []
    init(total: String, list: [dataItem]) {
        self.total = total
        self.list = list
    }
}