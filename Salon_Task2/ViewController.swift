//
//  ViewController.swift
//  Salon_Task2
//
//  Created by 相良 詠斗 on 2021/06/19.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstText: UITextField!
    @IBOutlet weak var secondText: UITextField!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var answerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        answerLabel.text = "0"
        
        self.firstText.keyboardType = UIKeyboardType.numberPad
        self.secondText.keyboardType = UIKeyboardType.numberPad
    }
    
    @IBAction func buttonAction(_ sender: Any) {
        
        let firstNum = NumberFormatter().number(from: firstText.text ?? "0") as? Double ?? Double(0)
        let secondNum = NumberFormatter().number(from: secondText.text ?? "0") as? Double ?? Double(0)
        
        if segmentedControl.selectedSegmentIndex == 3 && secondNum == Double(0) {
            answerLabel.text = "割る数には0以外を入力してください"
            return
        }
        
        answerLabel.text = "\(calculator(firstNum: firstNum, secondNum: secondNum))"
    }
    
    func calculator(firstNum: Double, secondNum: Double) -> Double {
        
        switch segmentedControl.selectedSegmentIndex {
        case 0: //+
            return firstNum + secondNum
        case 1: //-
            return firstNum - secondNum
        case 2: //×
            return firstNum * secondNum
        case 3: //÷
            return firstNum / secondNum
        default:
            return Double(0)
        }
    }
}

