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
    var nums = [Double]()
    var decimal = false
    var start = true
    
    @IBAction func clickNumber(_ sender: UIButton) {
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
        start = false
    }
    
    @IBAction func clickOperand(_ sender: UIButton) {
        calculate = true
        nums.append(Double(Result.text!)!)
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
        nums.append(Double(Result.text!)!)
        var result : Double
        switch operand {
        case "+":
            result = 0.0
            for num in nums {
                result += num
            }
            Result.text = "\(result)"
        case "-":
            result = nums[0] * 2
            for num in nums {
                result -= num
            }
            Result.text = "\(result)"
        case "*":
            result = 1.0
            for num in nums {
                result *= num
            }
            Result.text = "\(result)"
        case "/":
            result = nums[0] * nums[0]
            for num in nums {
                result /= num
            }
            Result.text = "\(result)"
        default:
            result = nums[0]
            for i in 1 ..< nums.count {
                result = result.truncatingRemainder(dividingBy: nums[i])
            }
        }
        Result.text = "\(result)"
        initialize()
    }
    
    func initialize() {
        calculate = false
        operand = ""
        action = ""
        nums = [Double]()
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

