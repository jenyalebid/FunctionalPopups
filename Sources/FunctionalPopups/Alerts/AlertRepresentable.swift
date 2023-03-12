//
//  AlertRepresentable.swift
//  FunctionalPopups
//
//  Created by Jenya Lebid on 2/18/23.
//

import SwiftUI

public struct AlertRepresentable: UIViewControllerRepresentable {
    
    public init() {}
    
    public func makeUIViewController(context: Context) -> UIViewController {
        AlertViewController()  
    }
    
    public func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
}
