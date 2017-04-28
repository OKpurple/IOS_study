//
//  DetailViewController.swift
//  MyMovieChart
//
//  Created by jwh on 2017. 1. 25..
//  Copyright © 2017년 jwh. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController : UIViewController,UIWebViewDelegate{
    
    @IBOutlet var spinner: UIActivityIndicatorView!
    @IBOutlet var wv: UIWebView!
 
    var mvo : MovieVO!
    
    override func viewDidLoad() {
        NSLog("linkurl = \(self.mvo?.detail), title = \(self.mvo?.title)")
        let navibar = self.navigationItem
        navibar.title = self.mvo?.title
        
        let url = URL(string: (self.mvo.detail)!)
        let req = URLRequest(url: url!)
        
        self.wv.loadRequest(req)
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        self.spinner.startAnimating()
    }
    func webViewDidFinishLoad(_ webView: UIWebView) {
        self.spinner.stopAnimating()
    }
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        self.spinner.stopAnimating()
        
        let alert = UIAlertController(title: "error", message: "can not read page", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "cancel", style: .cancel){
            (_) in
            _ = self.navigationController?.popViewController(animated: true)
        }
        alert.addAction(cancelAction)
        self.present(alert,animated: false,completion:nil)
    }
}
