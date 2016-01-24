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
        print("john")
        super.windowDidLoad()
        self.window!.orderFront(self)
        self.window!.level = Int(CGWindowLevelForKey(.FloatingWindowLevelKey))
        let icon:NSImage = NSImage(named: "pause_icon")!
        break_image.image = icon
        timeout_timer = intialise_timeout_timer()

        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }
    
    @IBAction func cancel_break(sender: NSButton) {
        // cancle break
    }
    
    @IBAction func add_five_minuts(sender: NSButton) {
        // Temp add five minuts to work period
    }
    
    func disable_window() {
        if(self.window!.visible) {
            print("john the second")
            timeout_timer.invalidate()
            timeout_timer = nil
            self.close()
            print("john the third")
        } else {
            print("demo")
        }
    }
    
    func intialise_timeout_timer() -> NSTimer {
        return NSTimer.scheduledTimerWithTimeInterval(settings_handler.get_timeout_time(), target: self, selector: Selector("disable_window"), userInfo: nil, repeats: true)
    }
    
}
