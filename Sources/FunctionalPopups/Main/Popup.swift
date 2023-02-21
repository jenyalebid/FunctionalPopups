//
//  Popup.swift
//  FunctionalPopups
//
//  Created by Jenya Lebid on 2/18/23.
//

import SwiftUI

public class Popup {
    
    static public var isSheetPresented: Bool {
        SheetPresenter.shared.baseSheet != nil
    }
    
    static public func presentSheet(_ view: any View) {
        SheetPresenter.shared.addSheet(view: view)
    }
    
    static public func presentAlert() {
        AlertPresenter.shared.addAlert(AppAlert(title: "ds", message: "ds"))
    }
}
