//
//  TextHelper.swift
//  code
//
//  Created by indraneel potnis on 04/01/22.
//

import Foundation

class TextHelper {
    
    static func checkValidCode(code : String) -> Bool {
        let codePattern = "[a-z]{3}-[a-z]{3}"
        let pred = NSPredicate(format:"SELF MATCHES %@", codePattern)
        return pred.evaluate(with: code)
    }
    
    static func shuffleString(code : String) -> String {
        var outputString = ""
        for i in 4...6 {
            outputString.append(code[i])
        }
        
        outputString.append("-")
        for i in 0...2 {
            outputString.append(code[i])
        }
        return outputString
    }
}
