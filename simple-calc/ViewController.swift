//
//  ViewController.swift
//  simple-calc
//
//  Created by studentuser on 10/24/17.
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

    @IBOutlet weak var Result: UILabel!

    var calculate = false
    var operand = ""
    var action = ""
    var num = 0.0
    var nums = [Int]()
    var decimal = false
    var start = true
    
    @IBAction func clickNumber(_ sender: UIButton) {
        start = false
        if (sender.tag == 10) {
            if (!decimal) {
                Result.text = Result.text! + "."
                decimal = true
            }
        } else if (Result.text == "0" || calculate || start) {
            Result.text = String(sender.tag)
        } else {
            Result.text = Result.text! + String(sender.tag)
        }
    }
    
    @IBAction func clickOperand(_ sender: UIButton) {
        calculate = true
        num = Double(UInt.init(Result.text!)!)
        switch sender.tag {
        case 0:
            operand = "+"
        case 1:
            operand = "-"
        case 2:
            operand = "*"
        case 3:
            operand = "/"
        default:
            operand = "%"
        }
    }
    
    @IBAction func clickEqual(_ sender: UIButton) {
        switch operand {
        case "+":
            Result.text = "\(num + Double(UInt.init(Result.text!)!))"
        case "-":
            Result.text = "\(num - Double(UInt.init(Result.text!)!))"
        case "*":
            Result.text = "\(num * Double(UInt.init(Result.text!)!))"
        case "/":
            Result.text = "\(num / Double(UInt.init(Result.text!)!))"
        default:
            Result.text = "\(num.truncatingRemainder(dividingBy: Double(UInt.init(Result.text!)!)))"
        }
    }
    
    func initialize() {
        calculate = false
        operand = ""
        action = ""
        num = 0.0
        nums = [Int]()
        decimal = false
        start = true
    }
    
    @IBAction func clickAction(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            action = "count"
        case 1:
            action = "avg"
        default:
            action = "fact"
        }
    }
    
}

