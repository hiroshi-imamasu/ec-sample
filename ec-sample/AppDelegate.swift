//
//  AppDelegate.swift
//  EC-sample
//
//  Created by Trial: Hiroshi Imamasu on 2019/06/25.
//  Copyright © 2019 Repro CRE. All rights reserved.
//

import UIKit
import Repro
import UserNotifications


extension AppDelegate {
    static var shared: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    var rootViewController: RootViewController {
        return window!.rootViewController as! RootViewController
    }
}




@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        /*
         Use the following method for debaug your application.
         
         Refer to the documentation for more detail information.
         (JP) https://docs.repro.io/ja/dev/sdk/log.html#id1
         (EN) https://docs.repro.io/en/dev/sdk/log.html#id1
         
         */
        Repro.set(logLevel: .debug)
        
        
        
        
        
        /*
         Using the follwing method, You can deley showing the inApp message.
         This method is useful when you fire inApp message as the application boot up. For it sometimes happens that inApp message doesn't
         appear because the splash screen prevents it.
         
         Refer to the documentation for more detail information.
         (JP) https://docs.repro.io/ja/dev/sdk/in-app-message.html#id3
         (EN) https://docs.repro.io/en/dev/sdk/in-app-message.html#id3
         */
        Repro.disableInAppMessageOnActive()
        
        
        
        /*
         Set up Repro
         Refer to the documentation for more detail information.
         (JP) https://docs.repro.io/ja/dev/sdk/getstarted/ios.html#ios-setup
         (EN) https://docs.repro.io/en/dev/sdk/getstarted/ios.html#ios-setup
         */
        Repro.setup(token: "YOUR_TOKEN")
        
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.rootViewController = RootViewController()
        window?.makeKeyAndVisible()
        
        
        /*
         Push notification setup
         You need a certificate file(p12) to send push notifications
         Refer to the documentation for more detail information.
         (JP) https://docs.repro.io/ja/dev/sdk/push-notification/setup-ios.html#apns-ios
         (EN) https://docs.repro.io/en/dev/sdk/push-notification/setup-ios.html#apns-ios
         */
        
        if #available (iOS 10.0, *) {
            let center = UNUserNotificationCenter.current()
            UNUserNotificationCenter.current().delegate = self as? UNUserNotificationCenterDelegate
            center.requestAuthorization(options: [.sound, .alert, .badge], completionHandler: { (granted, error) in
            })
            application.registerForRemoteNotifications()
        } else {
            let settings: UIUserNotificationSettings = UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
            UIApplication.shared.registerUserNotificationSettings(settings)
            UIApplication.shared.registerForRemoteNotifications()
        }
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {}
    
    func applicationDidEnterBackground(_ application: UIApplication) {}
    
    func applicationWillEnterForeground(_ application: UIApplication) {}
    
    func applicationDidBecomeActive(_ application: UIApplication) {}
    
    func applicationWillTerminate(_ application: UIApplication) {}
    
    // AppDelegate.swift
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        Repro.setPushDeviceToken(data: deviceToken)
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("Remote Notification Error: \(error)")
    }
    
    
}
