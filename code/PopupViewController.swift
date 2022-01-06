//
//  PopupViewController.swift
//  code
//
//  Created by indraneel potnis on 04/01/22.
//

import UIKit

class PopupViewController: UIViewController , UIGestureRecognizerDelegate {

    @IBOutlet weak var popupView: UIView!
    weak var shuffleListener : ShuffleListener?
    var code : String?
    
    @IBOutlet weak var imageIcon: UIImageView!
    @IBOutlet weak var codeLabel: UILabel!
    
    @IBOutlet weak var imageIconHeightConstraint: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.black.withAlphaComponent(0.50)
            //customizing the dialog box view
        popupView.layer.cornerRadius = 6.0
        popupView.layer.borderWidth = 1.2
        popupView.layer.borderColor = UIColor.gray.cgColor
        popupView.isUserInteractionEnabled = true
        
        
        codeLabel.text = code
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        tap.delegate = self
        view.addGestureRecognizer(tap)

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
    
    @IBAction func dismissTapped(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate(alongsideTransition: { context in
            if UIApplication.shared.statusBarOrientation.isLandscape {
                self.imageIconHeightConstraint.constant = 0
                self.imageIcon.isHidden = true
            } else {
                self.imageIcon.isHidden = false
                self.imageIconHeightConstraint.constant = 64
            }
        })
    }
}
