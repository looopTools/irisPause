//
//  settings_view.swift
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

import Cocoa

class settings_view: NSViewController, CCNPreferencesWindowControllerProtocol {

    @IBOutlet weak var break_time_label: NSTextField!
    @IBOutlet weak var work_period_label: NSTextField!
    
    @IBOutlet weak var extend_yes: NSButton!
    @IBOutlet weak var extend_no: NSButton!
    
    @IBOutlet weak var save_settings: NSButton!
    @IBOutlet weak var restore_defaults: NSButton!
    
    var extend: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        break_time_label.stringValue = double_to_string(get_timeout_time())
        // Do view setup here.
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    override init?(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: "settings_view", bundle: nil)
    }
    
    func preferenceIcon() -> NSImage! {
        return NSImage(named: "general")
    }
    
    func preferenceTitle() -> String! {
        return "General"
    }
    
    func preferenceIdentifier() -> String! {
        return "General"
    }
    
    @IBAction func save_settings(sender: NSButtonCell) {
        var able_to_save: Bool = true
        var tmp_timeout: Double = 0.0
        var tmp_work_period: Double = 0.0
        
        if !is_string_valid_float(break_time_label.stringValue) {
            // FIRE error
            able_to_save = false
        } else {
            tmp_timeout = string_to_double(break_time_label.stringValue)
        }
        
        if !is_string_valid_float(work_period_label.stringValue) {
            able_to_save = false
        } else {
            tmp_work_period = string_to_double(work_period_label.stringValue)
        }
        
        if able_to_save {
            set_timeout_time(tmp_timeout)
            set_work_period(tmp_work_period)
            // Remeber extended
            
        }
    }
    @IBAction func is_selected(sender: NSButton) {
        if sender == extend_yes {
            extend = true
        } else if sender == extend_no {
            extend = false
        }
        
    }
}