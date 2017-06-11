//
//  AppDelegate.swift
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


@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate { 

    var settings_handler = settings_handling.settings_handler
    let priority = DispatchQueue.GlobalQueuePriority.default
    var workperiod_timer: Timer!
    
    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var statusMenu: NSMenu!
    
//    let cscreens = NSScreen.screens()
//    var break_windows = [break_window]();
    
    var preference:CCNPreferencesWindowController!
    
    let bw = break_window(windowNibName: "break_window")
    
    let statusItem = NSStatusBar.system().statusItem(withLength: -1)
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        settings_handler.load_settings()
        
        // Setup status menu icon and menu options
        let icon = NSImage(named: "statusIcon")
        icon?.isTemplate = true
        statusItem.image = icon
        statusItem.menu = statusMenu
        
        // Setup preference
        preference = CCNPreferencesWindowController()
        preference.centerToolbarItems = true
        preference.setPreferencesViewControllers([settings_view(), about_view()])
        
        workperiod_timer = intialise_timer()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    @IBAction func settingsClicked(_ sender: NSMenuItem) {
        preference.showPreferencesWindow()
        
    }
        
    @IBAction func close_application(_ sender: NSMenuItem) {
        NSApplication.shared().terminate(self)
    }
    
//    func setup_break_windows() {
//        for cscreen in cscreens! {
//            var break_window = break_window(windowNibName: "break_window")
//            
//        }
//    }
//    
    func show_break_window() {
        //bw.showWindow(nil)
        bw.show_window()

    }
    
    func intialise_timer() -> Timer {
        return Timer.scheduledTimer(timeInterval: Double(settings_handler.get_work_period() * 60), target: self, selector: #selector(AppDelegate.show_break_window), userInfo: nil, repeats: true)
    }
}
