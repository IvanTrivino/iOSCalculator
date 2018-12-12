//
//  ViewController.swift
//  Calculator
//
//  Created by Ivan Camilo Triviño López on 12/11/18.
//  Copyright © 2018 Ivan Camilo Triviño López. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var result: Float = 0
    var number: String = ""
    var previousValue: Float = 0
    var operation: String = ""
    
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        printResultLabel("0")
    }

    
    @IBAction func clearOperation(_ sender: Any) {
        number = ""
        operation = ""
        result = 0
        printResultLabel("0")
    }
    
    @IBAction func division(_ sender: UIButton) {
        setOperationValues("divide")
    }
    
    @IBAction func multiplication(_ sender: UIButton) {
        setOperationValues("multiply")
    }
    
    @IBAction func substraction(_ sender: UIButton) {
        setOperationValues("substract")
    }
    
    @IBAction func addition(_ sender: UIButton) {
        setOperationValues("add")
    }
    
    @IBAction func getResult(_ sender: UIButton) {
        if (operation.count > 0) && (number.count > 0){
            switch operation {
            case "divide":
                result = previousValue / Float(number)!
                number = String(result)
                printResultLabel(String(result))
            case "multiply":
                result = previousValue * Float(number)!
                number = String(result)
                printResultLabel(String(result))
            case "substract":
                result = previousValue - Float(number)!
                number = String(result)
                printResultLabel(String(result))
            case "add":
                result = previousValue + Float(number)!
                number = String(result)
                printResultLabel(String(result))
            default:
                result = 0
            }
        }
        
        operation = ""
    }
    
    func setOperationValues(_ operation: String){
        if number.count > 0{
            previousValue = Float(number)!
            number = ""
        }
        
        self.operation = operation
    }
    
    
    @IBAction func numberPressed(_ sender: UIButton) {
        number += String(sender.tag - 1)
        printResultLabel(number)
    }
    
    @IBAction func addDecimalDot(_ sender: UIButton) {
        number += "."
        printResultLabel(number)
    }
    
    @IBAction func changeSign(_ sender: UIButton) {
        number = String(Float(number)! * -1)
        printResultLabel(number)
    }

    @IBAction func percentage(_ sender: UIButton) {
        number = String(previousValue * (Float(number)! / 100))
        printResultLabel(number)
    }
    
    func printResultLabel(_ value: String){
        resultLabel.text = "\(value)"
    }
}

