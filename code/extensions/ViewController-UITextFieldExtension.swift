//
//  UITextFieldExtension.swift
//  code
//
//  Created by indraneel potnis on 07/01/22.
//

import UIKit

extension ViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder() // dismiss keyboard
            return true
        }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
 
        let currentText = textField.text ?? ""

            // attempt to read the range they are trying to change, or exit if we can't
        guard let stringRange = Range(range, in: currentText) else { return false }

        // add their new text to the existing text
        var updatedText = currentText.replacingCharacters(in: stringRange, with: string)

        // make sure the result is under 7 characters
        if updatedText.count > 7 {
            return false
        }

        
        let codePattern = "[a-z]{0,3}-?[a-z]{0,3}"
        let pred = NSPredicate(format:"SELF MATCHES %@", codePattern)
        if !pred.evaluate(with: updatedText) {
            return false
        }
        
        if updatedText.count <= 3 {
            return true
        }
        
        // insert - if not already present
        if updatedText.range(of: "-") == nil {
            let thirdIndex = updatedText.index(updatedText.startIndex, offsetBy: 3)
            updatedText.insert("-", at: thirdIndex)
            textField.text = updatedText
            keychainHelper.saveCode(code: updatedText)
            return false
        }
        
        var newString = ""
     
        // restructure the string so that - is in middle
        for char in updatedText where char != "-" {
            newString.append(char)
        }
        let thirdIndex = newString.index(newString.startIndex, offsetBy: 3)
        newString.insert("-", at: thirdIndex)
        textField.text = newString
        keychainHelper.saveCode(code: newString)
        return false
    }
}
