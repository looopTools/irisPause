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

class settings_handling: NSObject {
    
    var default_timeout: Int = 15
    var default_work_period: Int = 30
    
    var timeout_time: Int = 0
    var work_period: Int = 0
    
    var settings = NSUserDefaults.standardUserDefaults()
    
    static let settings_handler = settings_handling()
    
    func load_settings() {
        if Array(settings.dictionaryRepresentation().keys).contains("timeout") && get_timeout_time() != 0 {
            timeout_time = get_timeout_time()
        }else {
            timeout_time = default_timeout
            set_timeout_time(timeout_time)
        }
        
        if Array(settings.dictionaryRepresentation().keys).contains("work_period") {
            work_period = get_work_period()
        } else {
            work_period = default_work_period
            set_work_period(work_period)
        }

    }
    
    func set_timeout_time(time:Int) {
        settings.setInteger(time, forKey: "timeout")
    }
    
    func get_timeout_time() -> Int {
        let timeout = settings.integerForKey("timeout")
        
        if timeout >= 0 {
            return timeout
        } else {
            return -1
        }
    }
    
    func set_work_period(time:Int) {
        settings.setInteger(time, forKey: "work_period")
    }
    
    func get_work_period() -> Int {
        let work_period = settings.integerForKey("work_period")
        
        if work_period >= 0 {
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



}