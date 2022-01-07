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
    
    @IBOutlet weak var codeLabel: UILabel!
    let keychainHelper = KeychainHelper()
    
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

        codeTextField.delegate = self
        if let code = keychainHelper.retrieveCode() {
            codeLabel.text = code
        }
    }
    
}


extension ViewController : ShuffleListener {
    func onShuffleReceived() {
        if let text = codeTextField.text {
            codeTextField.text = TextHelper.shuffleString(code: text)
            keychainHelper.saveCode(code: codeTextField.text!)
        }
    }
    
}

