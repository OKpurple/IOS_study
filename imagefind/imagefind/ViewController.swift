//
//  ViewController.swift
//  imagefind
//
//  Created by jwh on 2017. 4. 11..
//  Copyright © 2017년 jwh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet var iv: UIImageView!

    @IBAction func btn(_ sender: Any) {
        
        let url = URL(fileURLWithPath: "http://127.0.0.1:8080/contents/upload/1")
        let data = try? Data(contentsOf: url)
        iv.image = UIImage(data: data!)
        
    }
   
}

