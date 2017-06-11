//
//  break_window.swift
//  irisPause
//
//  Created by Lars Nielsen on 18/01/16.
//  Copyright © 2016 Lars Nielsen. All rights reserved.
//

import Cocoa

class break_window: NSWindowController {
    
    @IBOutlet weak var break_image: NSImageView!
    
    @IBOutlet weak var counter_label: NSTextField!
    
    
    var timeout_timer: Timer!
    var count_down_timer: Timer!
    var settings_handler = settings_handling.settings_handler
    
    var counter = 0
    
    
    
    override func windowDidLoad() {
        super.windowDidLoad()
        self.window!.orderFront(self)
        self.window!.level = Int(CGWindowLevelForKey(.floatingWindow))
        self.window!.title = "irisPause"
        let icon:NSImage = NSImage(named: "pause_icon")!
        break_image.image = icon
    }
    
    
    @IBAction func cancel_break(_ sender: NSButton) {
        // cancle break
    }
    
    @IBAction func add_five_minuts(_ sender: NSButton) {
        // Temp add five minuts to work period
    }
    
    func show_window() {
        self.showWindow(nil)
        counter = settings_handler.get_timeout_time()
        timeout_timer = intialise_timeout_timer()
        count_down_timer = initialise_count_down_timer()
        
    }
    
    func update_label() {
        //counter_label.setStringValue = counter;
        counter_label.stringValue = String(counter)
        counter = counter - 1
        
    }
    
    func disable_window() {
        if(self.window!.isVisible) {
            print("Went into disable window")
            
            // Disable and resetting timers
            timeout_timer.invalidate()
            timeout_timer = nil
            count_down_timer.invalidate()
            count_down_timer = nil
            
            window?.close()
            print("disable completed")
        } else {
            print("demo")
        }
    }
    
    func intialise_timeout_timer() -> Timer {
        return Timer.scheduledTimer(timeInterval: Double(settings_handler.get_timeout_time()), target: self, selector: #selector(break_window.disable_window), userInfo: nil, repeats: true)
    }
    
    func initialise_count_down_timer() -> Timer {
        print("you got to be kidding")
            return Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(break_window.update_label), userInfo: nil, repeats: true)
    }
    
    @IBAction func close_window(_ sender: NSButton) {
        disable_window()
    }
}
