//
//  AlertPresenter.swift
//  FunctionalPopups
//
//  Created by Jenya Lebid on 2/18/23.
//

import SwiftUI
import UIKit

class AlertPresenter: ObservableObject {
    
    static var shared = AlertPresenter()
        
    var controller: UIViewController?
    
    @Published var currentAlert: AppAlert?
    var alertStack = [AppAlert]()
    
    
    func addAlert(_ alert: AppAlert) {
        alertStack.append(alert)
        if currentAlert == nil {
            DispatchQueue.main.async { [self] in
                withAnimation {
                    currentAlert = alert
                }
            }
        }
    }
    
    func alertDismiss() {
        DispatchQueue.main.async { [self] in
            alertStack.removeFirst()
            withAnimation {
                currentAlert = nil
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) { [self] in
                NotificationCenter.default.post(Notification(name: Notification.Name("FP_AlertDismiss"), object: nil))
                if !alertStack.isEmpty {
                    withAnimation {
                        currentAlert = alertStack.first
                    }
                }
            }
        }
    }
}
