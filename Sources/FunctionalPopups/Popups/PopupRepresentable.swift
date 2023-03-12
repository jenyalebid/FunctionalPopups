//
//  PopupRepresentable.swift
//  FunctionalPopups
//
//  Created by Jenya Lebid on 3/11/23.
//

import SwiftUI

struct PopupRepresentable<PopupContent: View>: UIViewControllerRepresentable {
    
    @Binding var isControllerPresented: Bool
    
    var popupContent: PopupContent
    
    func makeUIViewController(context: Context) -> UIViewController {
        PopupViewController(popupContent: popupContent)
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        if !isControllerPresented {
            uiViewController.presentedViewController?.dismiss(animated: false)
        }
    }
}
