//
//  ViewController.swift
//  SimpleCalc
//
//  Created by CHAN CHI YU on 12/10/2019.
//  Copyright © 2019 Billy  Chan. All rights reserved.
//

import UIKit
import Foundation
import Expression

class ViewController: UIViewController {
    
    
    @IBOutlet weak var mExpressionText: UITextField!
    @IBOutlet weak var mResultLabel: UILabel!
    let customView = UIView()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mExpressionText.inputView = customView //to replace the inputView of keyboard
        mExpressionText.tintColor = .orange
        
        let operators: [String] = ["%","√","⌫","/","*"]
        for opr in operators {
            print ("\(opr) valid? + \(Expression.isValidOperator(opr)) ")
        }
        
    }
       

    @IBAction func buttonPressed(_ sender: UIButton) {
        
         let buttonText = sender.currentTitle!
        
        if(buttonText.isOperand){
            print("\(buttonText) is a operand") //debugging

        }else {
            print("\(buttonText) is not a operand") //debugging
        }
        
        if(buttonText.isDigit || buttonText.isOperand){
         mExpressionText.insertText(buttonText)
            if(buttonText.requireParentheses){ //for the case of √
                mExpressionText.insertText("(")
            }
        }
        else if(buttonText == "DEL" && !mExpressionText.text!.isEmpty){
            mExpressionText.deleteBackward()
            print(mExpressionText.text!);
        
        }
    }
    
    @IBAction func evaluatePressed(_ sender: UIButton) {
        
        if let validText = mExpressionText.text{
                    let expression = Expression(validText, symbols: [
//                        symbols[.infix("%")] = { fmod($0[0], $0[1]) }
                        .infix("%"): { _ in throw Expression.Error.undefinedSymbol(.infix("%")) },
                        .prefix("√"): {sqrt($0[0])},
                        .postfix("%"): {$0[0]/100 },
                        ])
        
            let result = startEvaluation(expression)
            mResultLabel.text = result
        }
    }

    func startEvaluation(_ expression: Expression?)-> String {
        
        do{
            let result = try expression?.evaluate()
            print(result!.description);
            return result!.description
        }catch{
            print("出現錯誤 ： \(error)")
            return error.localizedDescription;
        }
    }
    
    func clear(){
         mExpressionText.text = ""
         mResultLabel.text = ""
     }
    
}
