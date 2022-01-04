//
//  ViewController.swift
//  code
//
//  Created by indraneel potnis on 04/01/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var codeTextField: UITextField!
    static let identifier = "PopupViewController"
    
    @IBAction func popupTapped(_ sender: Any) {
        if TextHelper.checkValidCode(code: codeTextField.text ?? "") {
        
            if let popupViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: ViewController.identifier) as? PopupViewController {
             
            popupViewController.modalPresentationStyle = .custom
            popupViewController.modalTransitionStyle = .crossDissolve
            
            popupViewController.shuffleListener = self
            popupViewController.code = codeTextField.text
            
            self.present(popupViewController, animated: true)
            }
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        codeTextField.delegate = self
    }

}


extension ViewController : ShuffleListener {
    func onShuffleReceived() {
        if let text = codeTextField.text {
            codeTextField.text = TextHelper.shuffleString(code: text)
        }
       
    }
    
}

extension ViewController : UITextFieldDelegate {
    
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
        if updatedText.count <= 3 {
            return true
        }
        
        // insert - if not already present
        if updatedText.range(of: "-") == nil {
            let thirdIndex = updatedText.index(updatedText.startIndex, offsetBy: 3)
            updatedText.insert("-", at: thirdIndex)
            textField.text = updatedText
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
        return false
    }
}

extension String {
    subscript(i: Int) -> String {
        return String(self[index(startIndex, offsetBy: i)])
    }
}

