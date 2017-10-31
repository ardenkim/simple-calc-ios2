//
//  HistoryViewController.swift
//  simple-calc
//
//  Created by studentuser on 10/31/17.
//

import UIKit

class HistoryViewController: UIViewController {
    var history = [String]()
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var historyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for calc in history {
            let label = UILabel(frame: CGRect(x: 0, y: 25 + history.index(of: calc)! * 40, width: 500, height: 100))
            label.text = calc
            self.scrollView.addSubview(label)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
