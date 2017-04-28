//
//  SecondViewController.swift
//  IOSTest
//
//  Created by jwh on 2017. 1. 23..
//  Copyright © 2017년 jwh. All rights reserved.
//

import UIKit

class SecondViewController : UIViewController{
    
    
    @IBAction func dismiss(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true )
    }
}
