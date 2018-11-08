//
//  ViewController.swift
//  Calculate
//
//  Created by Andriy on 08.11.18.
//  Copyright © 2018 AB. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var
        displayResultLabel:
        UILabel!
    
    var stillTyping = false
    
    var firstOperand: Double = 0
    
    var secondOperand: Double = 0
    
    var operationSign: String = ""

    var currentInput: Double {
        get {
            return Double(displayResultLabel.text!)!
        }
        set{
            displayResultLabel.text = "\(newValue)"
            stillTyping = false
        }
    }
    
    
    @IBAction func numberPressed(_ sender: UIButton) {

        let number = sender.currentTitle!
        
        if stillTyping == true {
            if (displayResultLabel.text?.characters.count)! < 20    {
                displayResultLabel.text = displayResultLabel.text! + number
            }
        } else {
            displayResultLabel.text = number
            stillTyping = true
        }
    }
    
    @IBAction func twoOperandsSignPressed(_ sender: UIButton) {
        
        operationSign = sender.currentTitle!
        
        firstOperand = currentInput
        
        stillTyping = false
        
    }
    
    func operateWithTwoOperands(operation: (Double, Double) -> Double){
        currentInput = operation(firstOperand, secondOperand)
        stillTyping = false
    }
    
    @IBAction func equalitySignPressed(_ sender: UIButton) {
        
        if stillTyping {
            secondOperand = currentInput
        }
        
        switch operationSign {
        case "+":
            operateWithTwoOperands{$0 + $1}
        case "-":
            operateWithTwoOperands{$0 - $1}
        case "✕":
            operateWithTwoOperands{$0 * $1}
        case "÷":
            operateWithTwoOperands{$0 / $1}
            
        default:
            break
        }
        
    }
    
}

