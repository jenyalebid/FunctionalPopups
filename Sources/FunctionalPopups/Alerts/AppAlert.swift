//
//  AppAlert.swift
//  FunctionalPopups
//
//  Created by Jenya Lebid on 2/18/23.
//

import Foundation

public struct AppAlert: Equatable {
    
    public static func == (lhs: AppAlert, rhs: AppAlert) -> Bool {
        false
    }
    
    
    public init(title: String, message: String, dismiss: AlertAction = AlertAction(text: "Okay"), actions: [AlertAction] = []) {
        self.title = title
        self.message = message
        self.dismiss = dismiss
        self.actions = actions
    }
    
    public var title: String
    public var message: String
    public var dismiss: AlertAction
    public var actions: [AlertAction] = []
}

public struct AlertAction {
    
    public enum AlertButtonRole {
        case dismiss
        case destructive
        case regular
    }
    
    public init(text: String, role: AlertButtonRole = .regular, action: @escaping (() -> ()) = {}) {
        self.text = text
        self.role = role
        self.action = {
            AlertAction.actionMaker {
                action()
            }
        }
    }
    
    public var text: String
    public var role: AlertButtonRole
    public var action: () -> ()
    
    static func actionMaker(action: () -> ()) {
        action()
        AlertPresenter.shared.alertDismiss()
    }
}
