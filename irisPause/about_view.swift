//
//  about_view.swift
//  irisPause
//
//  Created by Lars Nielsen on 16/01/16.
//  Copyright © 2016 Lars Nielsen. All rights reserved.
//

import Cocoa

class about_view: NSViewController, CCNPreferencesWindowControllerProtocol {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    override init?(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: "about_view", bundle: nil)
    }
    
    func preferenceIcon() -> NSImage! {
        return NSImage(named: "about")
    }
    
    func preferenceTitle() -> String! {
        return "About"
    }
    
    func preferenceIdentifier() -> String! {
        return "About"
    }

    
}
