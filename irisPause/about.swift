//
//  about.swift
//  irisPause
//
//  Created by Lars Nielsen on 15/01/16.
//  Copyright © 2016 Lars Nielsen. All rights reserved.
//

import Cocoa

class about: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init?(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: "PreferencesGeneralViewController", bundle: nil)
    }
    
    func preferenceIcon() -> NSImage! {
        return NSImage(named: NSImageNamePreferencesGeneral)
    }
    
    func preferenceTitle() -> String! {
        return "General"
    }
    
    func preferenceIdentifier() -> String! {
        return "GeneralPreferencesIdentifier"
    }
    
}
