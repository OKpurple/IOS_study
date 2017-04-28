//
//  ResultViewController.swift
//  Scene-ManualSegue
//
//  Created by jwh on 2017. 1. 23..
//  Copyright © 2017년 jwh. All rights reserved.
//

import UIKit

class ResultViewController : UIViewController{
    
    override func viewWillAppear(_ animated: Bool) {
        self.resultEmail.text = paramEmail
        self.resultUpdate.text = self.paramUpdate == true ? "자동갱신" : "자동갱신안함"
        self.resultInterval.text = "\(Int(paramInterval))분 마다 갱신"
    }
    
    @IBOutlet var resultEmail: UILabel!
    
    @IBOutlet var resultUpdate: UILabel!
    
    @IBOutlet var resultInterval: UILabel!
    
    var paramEmail = ""
    var paramUpdate = false
    var paramInterval : Double = 0
    
    @IBAction func onBack(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
    
    
}
