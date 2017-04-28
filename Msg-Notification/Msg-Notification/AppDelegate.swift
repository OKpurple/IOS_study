//
//  AppDelegate.swift
//  Msg-Notification
//
//  Created by jwh on 2017. 1. 24..
//  Copyright © 2017년 jwh. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let setting = UIUserNotificationSettings(types: [.alert, .badge, .sound], categories :nil)
        application.registerUserNotificationSettings(setting)
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
        if #available(iOS 10.0, *){
            let setting = application.currentUserNotificationSettings
            
            guard setting?.types != .none else{
                print("Cant Schedule")
                return
            }
            let nContent = UNMutableNotificationContent()
            
            nContent.badge = 1
            nContent.body = "quick coming!!"
            nContent.title = "LOCAL ALERT MESSAGE"
            nContent.subtitle = "subtitle"
            nContent.sound = UNNotificationSound.default()
            
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
            let request = UNNotificationRequest(identifier: "wakeup", content: nContent, trigger: trigger)
            
            UNUserNotificationCenter.current().add(request)

            
        } else {
            let setting = application.currentUserNotificationSettings
            
            guard setting?.types != .none else{
                print("Cant Schedule")
                return
            }
            let noti = UILocalNotification()
            noti.fireDate = Date(timeIntervalSinceNow: 10)
            noti.timeZone = TimeZone.autoupdatingCurrent
            noti.alertBody = "얼른 다시 접속"
            noti.alertAction = "학습하기"
            noti.applicationIconBadgeNumber = 1
            noti.soundName = UILocalNotificationDefaultSoundName
            noti.userInfo = ["name":"홍길동"]
            
            application.scheduleLocalNotification(noti)
        }
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

