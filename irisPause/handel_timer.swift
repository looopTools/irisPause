//
//  handel_timer.swift
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

class handel_timer: NSObject {
    
    var start: TimeInterval;
    var settings_handler = settings_handling.settings_handler
    var b_window = break_window(windowNibName: "break_window")
    
    override init() {
        start = Date().timeIntervalSince1970
    }
    
    func timeout_timer() {
        let stime: TimeInterval = Date().timeIntervalSince1970
        var ctime: TimeInterval = Date().timeIntervalSince1970
        
        b_window.showWindow(self)
        
        while ((Int)((ctime - stime) / 60)) != settings_handler.get_timeout_time() {
            ctime = Date().timeIntervalSince1970
        }
        
        b_window.close()
        work_period_timer()
    }
    
    func work_period_timer() {
        let stime: TimeInterval = Date().timeIntervalSince1970
        var ctime: TimeInterval = Date().timeIntervalSince1970
        
        while ((Int)(ctime - stime) / 60) != settings_handler.get_work_period() {
            ctime = Date().timeIntervalSince1970
            timeout_timer()
        }
    }

}
