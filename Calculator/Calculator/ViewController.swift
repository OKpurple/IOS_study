//
//  ViewController.swift
//  Calculator
//
//  Created by jwh on 2016. 12. 29..
//  Copyright © 2016년 jwh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet private weak var display: UILabel!
    
    private var userIsInTheMiddleOfTyping = false
    
    @IBAction private func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTyping{
            let textCurrentlyInDisPlay = display!.text!
            display!.text = textCurrentlyInDisPlay + digit
        }else{
            display!.text = digit
        }
        userIsInTheMiddleOfTyping = true
        
    }
   
    private var displayValue:Double{
        get{
            return Double(display.text!)!
        }
        set{
            display.text = String(newValue)
        }
    }
    
    private var brain = CalculatorBrain()
    
    @IBAction private func performOperation(_ sender: UIButton) {
        if userIsInTheMiddleOfTyping {
            brain.setOperand(displayValue)
            userIsInTheMiddleOfTyping = false
        }
        if let mathmaticalSymbol = sender.currentTitle {
          brain.performOperation(mathmaticalSymbol)
        }
        displayValue = brain.result
        
        
    
    

}
}
