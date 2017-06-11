//
//  convert_data.swift
//  irisPause
//
//  Created by Lars Nielsen on 16/01/16.
//  Copyright © 2016 Lars Nielsen. All rights reserved.
//

import Foundation

func string_to_double(_ str: String) -> Double {
    return NSString(string: str).doubleValue
}

func string_to_integer(_ str: String) -> Int {
    return NSString(string: str).integerValue
}

func double_to_string(_ d: Double) -> String {
    return String(format: "%f", d)
}

func integer_to_string(_ i: Int) -> String {
    return String(format: "%d", i)
}
