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
    
    override func windowDidLoad() {
        super.windowDidLoad()
        self.window!.orderFront(self)
        let icon:NSImage = NSImage(named: "pause_icon")!
        break_image.image = icon
        print("boop")
        

        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }
    
    @IBAction func cancel_break(sender: NSButton) {
        // cancle break
    }
    
    @IBAction func add_five_minuts(sender: NSButton) {
        // Temp add five minuts to work period
    }
}
