//
//  ViewController.swift
//  IOSTest
//
//  Created by jwh on 2017. 1. 23..
//  Copyright © 2017년 jwh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var uiTitle: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func sayHello(_ sender: Any) {
        self.uiTitle.text = "Hello, World!"
    }

    @IBAction func moveNext(_ sender: Any) {
        
        let uvc = self.storyboard!.instantiateViewController(withIdentifier: "SecondVC")
        
        uvc.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        
        self.present(uvc, animated: true)
    }

}

