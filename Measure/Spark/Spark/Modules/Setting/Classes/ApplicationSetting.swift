//
//  ApplicationSetting.swift
//  Spark
//
//  Created by Tarun Sudhams on 20/2/2019.
//  Copyright © 2019 Tarun Sudhams. All rights reserved.
//


import UIKit

class ApplicationSetting {
    struct Config {
        static let defaultUnit = "com.ruler.defaultUnit"
        static let displayFocus = "com.ruler.displayFocus"
    }
    struct Status {
        static var defaultUnit: MeasurementUnit.Unit = {
            guard let str = UserDefaults.standard.string(forKey: Config.defaultUnit) else {
                return MeasurementUnit.Unit.centimeter
            }
            return MeasurementUnit.Unit(rawValue: str) ?? MeasurementUnit.Unit.centimeter
            }() {
            didSet {
                UserDefaults.standard.setValue(defaultUnit.rawValue, forKey: Config.defaultUnit)
            }
        }
        
        static var displayFocus: Bool = {
            guard UserDefaults.standard.object(forKey: Config.displayFocus) != nil else  {
                return true
            }
            return UserDefaults.standard.bool(forKey: Config.displayFocus)
            }() {
            didSet {
                UserDefaults.standard.set(displayFocus, forKey: Config.displayFocus)
            }
        }
    }
    
}
