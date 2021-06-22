//
//  ViewController.swift
//  Salon_Task2
//
//  Created by 相良 詠斗 on 2021/06/19.
//

import UIKit

private enum Operation {
    case addition
    case subtraction
    case multiplication
    case division

    init?(selectedSegmentIndex: Int) {
        switch selectedSegmentIndex {
        case 0:
            self = .addition
        case 1:
            self = .subtraction
        case 2:
            self = .multiplication
        case 3:
            self = .division
        default:
            return nil
        }
    }
}

class ViewController: UIViewController {
    @IBOutlet private weak var firstTextField: UITextField!
    @IBOutlet private weak var secondTextField: UITextField!
    @IBOutlet private weak var segmentedControl: UISegmentedControl!
    @IBOutlet private weak var answerLabel: UILabel!
    
    private var textFields: [UITextField] { [firstTextField, secondTextField] }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        answerLabel.text = "0.0"
        
        textFields.forEach {
            $0.keyboardType = .numberPad
        }
    }
    
    @IBAction func buttonAction(_ sender: Any) {
        let numberFormatter = NumberFormatter()
        
        let numbers = textFields.map { numberFormatter.number(from: $0.text ?? "")?.doubleValue ?? 0.0 }

        let isDivisionByZero = segmentedControl.selectedSegmentIndex == 3 && numbers[1] == 0.0
        
        guard !isDivisionByZero else {
            answerLabel.text = "割る数には0以外を入力してください"
            return
        }
        
        answerLabel.text = "\(calculate(firstNum: numbers[0], secondNum: numbers[1]) ?? 0)"
    }
    
    func calculate(firstNum: Double, secondNum: Double) -> Double? {

        guard let operation = Operation(selectedSegmentIndex: segmentedControl.selectedSegmentIndex) else {
            return nil
        }
        
        switch operation {
        case .addition:
            return firstNum + secondNum
        case .subtraction:
            return firstNum - secondNum
        case .multiplication:
            return firstNum * secondNum
        case .division:
            return firstNum / secondNum
        }
    }
}
