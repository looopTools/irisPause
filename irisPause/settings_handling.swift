//
//  settings_handling.swift
//  irisPause
//
// Copyright (C) 2015 Lars Nielsen
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//    
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.

import Foundation


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
    
    // Needs testing to check if it returns a string
    func set_localised_language(language:String) {
        settings.setObject(language, forKey: "local_lang")
    }
    
    func get_localised_language() -> String {
        let localised_language = settings.stringForKey("local_lang")
        return localised_language!
    }
    
    
