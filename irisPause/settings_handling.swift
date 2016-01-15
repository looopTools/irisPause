//
//  settings_handling.swift
//  irisPause
//
//  Created by Lars Nielsen on 15/01/16.
//  Copyright © 2016 Lars Nielsen. All rights reserved.
//

import Foundation

class settings_handling: NSObject {
    
    let settings = NSUserDefaults.standardUserDefaults()
    
    func set_timeout_time(time:Double) {
        settings.setDouble(time, forKey: "timeout")
    }
    
    func get_timeout_time() -> Double {
        let timeout = settings.doubleForKey("timeout")

        if timeout >= 0.0 {
            return timeout
        } else {
            return -1
        }
    }
    
    func set_work_period(time:Double) {
        settings.setDouble(time, forKey: "work_period")
    }
    
    func get_work_period() -> Double {
        let work_period = settings.doubleForKey("work_period")
        
        if work_period >= 0.0 {
            return work_period
        } else {
            return -1
        }
    }
    
    func set_enable_extend_work_period(enable:Bool) {
        settings.setBool(enable, forKey: "enable_extend")
    }
    
    func get_enable_extend_work_period() -> Bool {
        let enable_extend = settings.boolForKey("enable_extend")
        return enable_extend
    }
    
    
}