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
    
    var start: NSTimeInterval;
    
    override init() {
        start = NSDate().timeIntervalSince1970
    }
    
    func start_timer() {
        var ctime: NSTimeInterval = NSDate().timeIntervalSince1970
        
        while ((ctime - start) / 60) != get_timeout_time() {
            ctime = NSDate().timeIntervalSince1970
        }
        
    }

}