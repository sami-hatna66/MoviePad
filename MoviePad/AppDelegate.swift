//
//  AppDelegate.swift
//
//  Created by Sami Hatna on 27/06/2021.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var statusItemManager: StatusItemManager!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        statusItemManager = StatusItemManager()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
    }


}

