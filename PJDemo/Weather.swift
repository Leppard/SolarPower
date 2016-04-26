//
//  Weather.swift
//  PJDemo
//
//  Created by apple on 16/4/24.
//  Copyright © 2016年 apple. All rights reserved.
//

import Foundation



class Weather
{
    
    enum WeatherType
    {
        case Sunny
        case Cloudy
        case Overcast
        case Rainy
    }
    
    var weatherType : WeatherType
    var temperature : Double
    
    init(weatherType:WeatherType,temperature:Double)
    {
        self.weatherType = weatherType
        self.temperature = temperature
    }
    init()
    {
        self.weatherType = .Sunny
        self.temperature = 0.0
    }
}