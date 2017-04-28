//
//  ViewController.swift
//  Msg-Notification
//
//  Created by jwh on 2017. 1. 24..
//  Copyright © 2017년 jwh. All rights reserved.
//

import UIKit
import UserNotifications
class ViewController: UIViewController {

    @IBOutlet var msg: UITextField!
  
    @IBOutlet var datepicker: UIDatePicker!

    
    @IBAction func save(_ sender: Any) {
        
        let setting = UIApplication.shared.currentUserNotificationSettings
        
        guard setting?.types != .none else{
            let alert = UIAlertController(title: "register alert", message: "not allow", preferredStyle: .alert)
            
            let ok = UIAlertAction(title: "ok", style: .default)
            alert.addAction(ok)
            
            self.present(alert, animated: false)
            return
        }
            if #available(iOS 10, *){
                let nContent = UNMutableNotificationContent()
                nContent.body = (self.msg.text)!
                nContent.title = "miri alert"
                nContent.sound = UNNotificationSound.default()
                
                let time = self.datepicker.date.timeIntervalSinceNow
                
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: time, repeats: false)
                
                let request = UNNotificationRequest(identifier: "alarm", content: nContent, trigger: trigger)
                
                UNUserNotificationCenter.current().add(request){
                    (_) in
                    let date = self.datepicker.date.addingTimeInterval(9*60*60)
                    let message = "registered alert. is = \(date) to go"
                    let alert = UIAlertController(title: "알림등록", message: message, preferredStyle: .alert)
                    
                    let ok = UIAlertAction(title: "ok", style: .default)
                    alert.addAction(ok)
                    
                    self.present(alert, animated: false)
                }
                
            }else{
                
            }
        
        
        
    }
    
 
}

