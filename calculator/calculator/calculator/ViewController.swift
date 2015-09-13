//
//  ViewController.swift
//  calculator
//
//  Created by Max on 15/9/9.
//  Copyright (c) 2015年 Maxzsc. All rights reserved.
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

    @IBOutlet weak var display: UILabel!
    
    var userIsInTheMiddleOfTypingNumber = false

    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTypingNumber{
            display.text = display.text! + digit
        }else{
            display.text = digit
            userIsInTheMiddleOfTypingNumber = true
        }
        
    }
    
    var operandStack = Array<Double>()
    
    @IBAction func enterPress() {
        if userIsInTheMiddleOfTypingNumber{
            userIsInTheMiddleOfTypingNumber = false
            operandStack.append(displayValue)
        }
        println("operandStack = \(operandStack)")
    }
    var displayValue: Double{
        get{
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set{
            display.text = "\(newValue)"
            userIsInTheMiddleOfTypingNumber = false
        }
    }

    
    @IBAction func operationPress(sender: UIButton) {
        enterPress()
        let operation = sender.currentTitle!
        switch operation{
        case "+": performOperation{$1+$0}
        case "−": performOperation{$1-$0}
        case "×": performOperation{$1*$0}
        case "÷": performOperation{$1/$0}
        case "√": performOperation{sqrt($0)}
        default: break
        }
    }
    
    func performOperation(operation:(Double,Double)->Double){
        if(operandStack.count>=2){
            displayValue = operation(operandStack.removeLast(),operandStack.removeLast())
            operandStack.append(displayValue)
            enterPress()
        }
    }
    
    func performOperation(operation:(Double)->Double){
        if(operandStack.count>=1){
            displayValue = operation(operandStack.removeLast())
            operandStack.append(displayValue)
            enterPress()
        }
    }

    
    
}

