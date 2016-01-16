//
//  validate_data.swift
//  irisPause
//
//  Created by Lars Nielsen on 16/01/16.
//  Copyright © 2016 Lars Nielsen. All rights reserved.
//

import Foundation

func is_string_valid_float(str:String) -> Bool {
    if NSString(string: str).doubleValue <= 0.0 {
        return false
    }
    return true
}