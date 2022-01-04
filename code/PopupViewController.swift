//
//  PopupViewController.swift
//  code
//
//  Created by indraneel potnis on 04/01/22.
//

import UIKit

class PopupViewController: UIViewController , UIGestureRecognizerDelegate {

    @IBOutlet weak var popupView: UIView!
    static let identifier = "PopupViewController"
    weak var shuffleListener : ShuffleListener?
    var code : String?
    
    @IBOutlet weak var codeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.black.withAlphaComponent(0.50)
            //customizing the dialog box view
        popupView.layer.cornerRadius = 6.0
        popupView.layer.borderWidth = 1.2
        //popupView.layer.borderColor = UIColor(named: "dialogBoxGray")?.cgColor
        popupView.layer.borderColor = UIColor.gray.cgColor
        popupView.isUserInteractionEnabled = true
        
        
        codeLabel.text = code
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        tap.delegate = self
        view.addGestureRecognizer(tap)

    }
    
    static func showPopup(parentVC: UIViewController){
        //creating a reference for the dialogView controller
        if let popupViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: identifier) as? PopupViewController {
        popupViewController.modalPresentationStyle = .custom
        popupViewController.modalTransitionStyle = .crossDissolve
        //presenting the pop up viewController from the parent viewController
        parentVC.present(popupViewController, animated: true)
        }
      }

    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        self.dismiss(animated: false, completion: nil)
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        return touch.view == gestureRecognizer.view
    }
    @IBAction func shuffleTapped(_ sender: Any) {
        shuffleListener?.onShuffleReceived()
        self.dismiss(animated: false, completion: nil)
    }
}
