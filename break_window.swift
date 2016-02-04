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
    @IBOutlet weak var time_lbl: NSTextField!
    
    var timeout_timer: NSTimer!
    var settings_handler = settings_handling.settings_handler
    
    override func windowDidLoad() {
        super.windowDidLoad()
        self.window!.orderFront(self)
        self.window!.level = Int(CGWindowLevelForKey(.FloatingWindowLevelKey))
        let icon:NSImage = NSImage(named: "pause_icon")!
        break_image.image = icon
    }
    
    @IBAction func cancel_break(sender: NSButton) {
        // cancle break
    }
    
    @IBAction func add_five_minuts(sender: NSButton) {
        // Temp add five minuts to work period
    }
    
    func show_window() {
        self.showWindow(nil)
        timeout_timer = intialise_timeout_timer()
    }
    
    func disable_window() {
        if(self.window!.visible) {
            print("Went into disable window")
            timeout_timer.invalidate()
            timeout_timer = nil
            window?.close()
            print("disable completed")
        } else {
            print("demo")
        }
    }
    
    func intialise_timeout_timer() -> NSTimer {
        return NSTimer.scheduledTimerWithTimeInterval(settings_handler.get_timeout_time(), target: self, selector: Selector("disable_window"), userInfo: nil, repeats: true)
    }
    
}