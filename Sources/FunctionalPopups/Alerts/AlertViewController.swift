//
//  AlertViewController.swift
//  FunctionalPopups
//
//  Created by Jenya Lebid on 2/18/23.
//

import UIKit
import SwiftUI

class AlertViewController: UIViewController {
    
    let notificationCenter = NotificationCenter.default
    var presented: UIViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        definesPresentationContext = true
        
        notificationCenter.addObserver(self, selector: #selector(dismiss(_:)), name: Notification.Name("FP_AlertDismiss"), object: nil)
    }

    override func viewDidAppear(_ animated: Bool) {
        let alert = UIHostingController(rootView: AlertHostView())
        alert.modalPresentationStyle = .overFullScreen
        alert.view.backgroundColor = .clear
        
        if self.presentedViewController == nil {
            AlertPresenter.shared.controller = self
            self.present(alert, animated: false, completion: nil)
            presented = self.presentedViewController!

        }
        else {
            presented = self.presentedViewController!
            while presented.presentedViewController != nil {
                presented = presented.presentedViewController!
                AlertPresenter.shared.controller = presented
            }
            presented.present(alert, animated: false)
        }
    }
    
    @objc
    func dismiss(_ notification: NSNotification) {
        presented.dismiss(animated: false)
    }
}
