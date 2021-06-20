//
//  ViewController.swift
//  Salon_Task2
//
//  Created by 相良 詠斗 on 2021/06/19.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var secondTextField: UITextField!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var answerLabel: UILabel!
    
    private var textFiels: [UITextField] { [firstTextField, secondTextField] }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        answerLabel.text = "0.0"
        
        textFiels.forEach {
            $0.keyboardType = .numberPad
        }
    }
    
    @IBAction func buttonAction(_ sender: Any) {
        let numberFormatter = NumberFormatter()
        
        let numbers = textFiels.map { numberFormatter.number(from: $0.text ?? "")?.doubleValue ?? 0.0 }
        
        if segmentedControl.selectedSegmentIndex == 3 && numbers[1] == 0.0 {
            answerLabel.text = "割る数には0以外を入力してください"
            return
        }
        
        answerLabel.text = "\(calculator(firstNum: numbers[0], secondNum: numbers[1]))"
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

