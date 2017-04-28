//
//  ViewController.swift
//  Lang
//
//  Created by jwh on 2017. 4. 4..
//  Copyright © 2017년 jwh. All rights reserved.
//

import UIKit
import AVFoundation.AVFAudio

class ViewController: UIViewController {
    var p =  AVPlayer()
    
  
    @IBOutlet var text: UITextField!
    
    @IBAction func play(_ sender: Any) {
        do
        {
            let str = text.text!.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
            let str1 = "http://127.0.0.1:33200/tts/" + str!
            print (str1.debugDescription)
            let url = NSURL(string: str1)
            p = AVPlayer(url: url as! URL)
        }
        p.play()
    }
   
}

