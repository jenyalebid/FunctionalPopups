//
//  PopupRepresentable.swift
//  
//
//  Created by Jenya Lebid on 2/18/23.
//

import SwiftUI

public struct PopupRepresentable: UIViewControllerRepresentable {
    
    public init() {}
    
    public func makeUIViewController(context: Context) -> UIViewController {
        PopupViewController()  
    }
    
    public func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
}
