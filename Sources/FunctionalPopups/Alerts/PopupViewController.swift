//
//  PopupViewController.swift
//  FunctionalPopups
//
//  Created by Jenya Lebid on 2/18/23.
//

import UIKit
import SwiftUI

class PopupViewController: UIViewController {
    
    let notificationCenter = NotificationCenter.default
    var presented: UIViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        definesPresentationContext = true
        
        notificationCenter.addObserver(self, selector: #selector(dismiss(_:)), name: Notification.Name("FP_AlertDismiss"), object: nil)
    }

    override func viewDidAppear(_ animated: Bool) {
        let popup = UIHostingController(rootView: AlertHostView())
        popup.modalPresentationStyle = .overFullScreen
        popup.view.backgroundColor = .clear
        
        if self.presentedViewController == nil {
            AlertPresenter.shared.controller = self
            self.present(popup, animated: false, completion: nil)
            presented = self.presentedViewController!

        }
        else {
            presented = self.presentedViewController!
            while presented.presentedViewController != nil {
                presented = presented.presentedViewController!
                AlertPresenter.shared.controller = presented
            }
            presented.present(popup, animated: false)
        }
    }
    
    @objc
    func dismiss(_ notification: NSNotification) {
        presented.dismiss(animated: false)
    }
}
