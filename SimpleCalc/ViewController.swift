//
//  ViewController.swift
//  SimpleCalc
//
//  Created by CHAN CHI YU on 12/10/2019.
//  Copyright © 2019 Billy  Chan. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var mExpressionText: UITextField!
    @IBOutlet weak var mResultLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
         let buttonText = sender.currentTitle!
        
        if(buttonText.isDigit || buttonText.isOperand){
         mExpressionText.insertText(buttonText)
        }
    }
    
    
}
