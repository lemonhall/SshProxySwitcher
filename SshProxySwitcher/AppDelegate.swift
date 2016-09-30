//
//  AppDelegate.swift
//  SshProxySwitcher
//
//  Created by Hall Lemon on 2016/9/24.
//  Copyright © 2016年 Hall Lemon. All rights reserved.
//

import Cocoa
import Foundation

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    
    @IBOutlet weak var statusMenu: NSMenu!
    let statusItem = NSStatusBar.system().statusItem(withLength: NSVariableStatusItemLength)
    
    //连接代理
    @IBAction func connectClicked(_ sender: NSMenuItem) {
        let task = Process();
            task.launchPath = "/usr/sbin/networksetup"
            task.arguments = ["-setsocksfirewallproxystate","Wi-Fi","on"]
            task.launch()
    }

    //断开代理
    @IBAction func disconnectClicked(_ sender: NSMenuItem) {
        let task = Process();
            task.launchPath = "/usr/sbin/networksetup"
            task.arguments = ["-setsocksfirewallproxystate","Wi-Fi","off"]
            task.launch()
    }
    
    //退出
    @IBAction func quitClicked(_ sender: NSMenuItem) {
        NSApplication.shared().terminate(self)
    }

    //程序初始化
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        let icon = NSImage(named: NSImageNameQuickLookTemplate)
        icon?.isTemplate = true // best for dark mode
        statusItem.image = icon
        statusItem.menu = statusMenu
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

