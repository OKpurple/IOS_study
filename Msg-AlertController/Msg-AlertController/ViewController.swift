//
//  ViewController.swift
//  Msg-AlertController
//
//  Created by jwh on 2017. 1. 23..
//  Copyright © 2017년 jwh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var result: UILabel!
    
    @IBAction func alert(_ sender: Any) {
        let alert = UIAlertController(title: "선택", message: "select item", preferredStyle: .alert)
        
        let cancel = UIAlertAction(title: "cancel", style: .cancel){
            (_) in
            self.result.text = "취소버튼"
        }
        let ok = UIAlertAction(title: "ok", style: .default){
            (_) in
            self.result.text = "확인버튼"
        }
        let exec = UIAlertAction(title: "exec", style: .destructive){
            (_) in
            self.result.text = "실행버튼"
        }
        let stop = UIAlertAction(title: "stop", style: .default){
            (_) in
            self.result.text = "중지버튼"
        }
        
        
        
        alert.addAction(ok)
        alert.addAction(cancel)
        alert.addAction(exec)
        alert.addAction(stop)
        
        self.present(alert, animated:false)
        
    }
    
    @IBAction func login(_ sender: Any) {
        let title = "itunes to login"
        let message = "input user's Apple ID black@naver.com"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let cancel = UIAlertAction(title: "cancel", style: .cancel)
        
        
        let ok = UIAlertAction(title: "ok", style: .default){
            (_) in
            if let tf = alert.textFields?[0]{
                print("input value is \(tf.text!)")
            }else{
                print("none input value")
            }
        }
        
        alert.addAction(cancel)
        alert.addAction(ok)
        
        alert.addTextField(configurationHandler: { (tf) in
            tf.placeholder = "암호"
            tf.isSecureTextEntry = true
            
        })
        self.present(alert, animated: false)
    }
    
    @IBAction func auth(_ sender: Any) {
        let alert = UIAlertController(title:nil, message:"login",preferredStyle: .alert)
        
        let cancel = UIAlertAction(title:"cancel",style:.cancel)
        let ok = UIAlertAction(title: "ok", style: .default){
            (_) in
            let loginId = alert.textFields?[0].text
            let loginPw = alert.textFields?[1].text
            
        if loginId == "black" && loginPw == "1234" {
            self.result.text = "\(loginId!)님 환영합니다"
        }else{
            self.result.text = "failed"
        }
        }
        
        alert.addAction(cancel)
        alert.addAction(ok)
        
        alert.addTextField(configurationHandler: {(tf) in
            tf.placeholder = "id"
            tf.isSecureTextEntry = false
        })
        alert.addTextField(configurationHandler: {(tf) in
            tf.placeholder = "pw"
            tf.isSecureTextEntry = true
        })
        
        self.present(alert,animated:false)
    }
}

