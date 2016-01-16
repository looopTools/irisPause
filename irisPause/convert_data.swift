//
//  convert_data.swift
//  irisPause
//
//  Created by Lars Nielsen on 16/01/16.
//  Copyright © 2016 Lars Nielsen. All rights reserved.
//

import Foundation

func string_to_double(str: String) -> Double {
    return NSString(string: str).doubleValue
}

func double_to_string(d: Double) -> String {
    return String(format: "%f", d)
}