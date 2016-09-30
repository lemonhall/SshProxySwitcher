1、参考资料
http://footle.org/WeatherBar/

================================

2、缘起
我最近翻的时候，都用是ssh，所以需要设置socks代理，本来脚本也就一句话的事情；

如果不用命令行，就得点击到网络设置，选择WIFI，点击代理设置，勾选socks代理，点击确定，然后点击应用；

总共是，一次右键，一次左键，一次左键，一次左键，一次左键，一次左键；

总共：6次点击，相当烦躁

================================

3、脚本版
https://richardkmiller.com/925/script-to-enabledisable-socks-proxy-on-mac-os-x

脚本版，其实很简单

================================

4、做成menu bar 版本

参考了：http://footle.org/WeatherBar/

================================

5、代码

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

================================

6、不足
因为是用了Process这个东西，貌似没有root权限，所以每次更改还需要输入密码

略麻烦，之后看看能不能解决掉吧；

其实也可以把链接ssh服务器，以及设置端口号的东西加入进来，我现在还是用的一个脚本

不够美观，也没有可以设置的界面
