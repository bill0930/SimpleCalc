//
//  StringExtension.swift
//  SimpleCalc
//
//  Created by CHAN CHI YU on 13/10/2019.
//  Copyright © 2019 Billy  Chan. All rights reserved.
//

import Foundation

extension String  {
    var isDigit: Bool {
        return !isEmpty && rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
    }
    
    var isNumber: Bool {
        return !isEmpty && rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
    }
    
    var isOperand: Bool {
        return self == "+" || self == "-" || self == "*" || self == "/" || self == "%" || self == "(" || self == ")" || self == "√"
            || self == "SHIFT"
    }
    
    var requireParentheses: Bool {
        return self == "√"
    }
}
