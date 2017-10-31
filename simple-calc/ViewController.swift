//
//  ViewController.swift
//  simple-calc
//
//  Created by studentuser on 10/24/17.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var Result: UILabel!
    
    var calculate = false
    var operand = ""
    var nums = [Double]()
    var decimal = false
    var start = true
    
    var history = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let historyVC: HistoryViewController = segue.destination as! HistoryViewController
        historyVC.history = self.history
    }
    
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
        var historyLine = ""
        var begin = true;
        switch operand {
        case "+":
            result = 0.0
            for num in nums {
                result += num
                if (begin) {
                    historyLine += "\(Double(num)) "
                    begin = false;
                } else {
                    historyLine += "+ \(Double(num)) "
                }
            }
        case "-":
            result = nums[0] * 2
            for num in nums {
                if (begin) {
                    historyLine += "\(Double(num)) "
                    begin = false;
                } else {
                    historyLine += "- \(Double(num)) "
                }
                result -= num
            }
        case "*":
            result = 1.0
            for num in nums {
                if (begin) {
                    historyLine += "\(Double(num)) "
                    begin = false;
                } else {
                    historyLine += "* \(Double(num)) "
                }
                result *= num
            }
        case "/":
            result = nums[0] * nums[0]
            for num in nums {
                if (begin) {
                    historyLine += "\(Double(num)) "
                    begin = false;
                } else {
                    historyLine += "/ \(Double(num)) "
                }
                result /= num
            }
        case "%":
            result = nums[0]
            historyLine = "\(result) "
            for i in 1 ..< nums.count {
                historyLine += "% \(Double(nums[i])) "
                result = result.truncatingRemainder(dividingBy: nums[i])
            }
        case "count":
            result = Double(nums.count)
            for num in nums {
                if (begin) {
                    historyLine += "\(Double(num)) "
                    begin = false;
                } else {
                    historyLine += "count \(Double(num)) "
                }
                result /= num
            }
        case "avg":
            result = 0.0
            for num in nums {
                if (begin) {
                    historyLine += "\(Double(num)) "
                    begin = false;
                } else {
                    historyLine += "avg \(Double(num)) "
                }
                result += num
            }
            result /= Double(nums.count)
        default:
            result = nums[0]
            historyLine = "\(nums[0]) factor "
            for i in 1 ..< Int(nums[0])  {
                result *= Double(i)
            }
        }
        historyLine += "= \(result)"
        history.append(historyLine);
        Result.text = "\(result)"
        initialize()
    }
    
    func initialize() {
        calculate = false
        operand = ""
        nums = [Double]()
        decimal = false
        start = true
    }
    
    @IBAction func clickAction(_ sender: UIButton) {
        calculate = true
        nums.append(Double(Result.text!)!)
        switch sender.tag {
        case 0:
            operand = "count"
        case 1:
            operand = "avg"
        default:
            operand = "fact"
        }
    }
    
}

