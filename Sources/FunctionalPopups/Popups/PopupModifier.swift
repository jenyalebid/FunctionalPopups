//
//  PopupModifier.swift
//  FunctionalPopups
//
//  Created by Jenya Lebid on 3/11/23.
//

import SwiftUI

struct PopupModifier<PopupContent: View>: ViewModifier {

    @Binding var isPresented: Bool
    
    @State private var isPopupPresented = false
    @State private var isControllerPresented = false

    var popupContent: PopupContent
    
    init(isPresented: Binding<Bool>, @ViewBuilder popupContent: () -> PopupContent) {
        self._isPresented = isPresented
        self.popupContent = popupContent()
    }
    
    func body(content: Content) -> some View {
        content
            .overlay {
                if isPopupPresented {
                    Color.black.opacity(0.50)
                        .transition(.opacity)
                }
                if isControllerPresented {
                    PopupRepresentable(isControllerPresented: $isControllerPresented, popupContent: PopupHostView(isPresented: $isPresented, isPopupPresented: $isPopupPresented, isControllerPresented: $isControllerPresented, popupContent: popupContent))
                        .background(Color.black.opacity(0.50))
                }
            }
            .onChange(of: isPresented) { presented in
                if presented {
                    isControllerPresented = true
                }
            }
    }
}

public extension View {
    
    func popup<PopupContent: View>(isPresented: Binding<Bool>, @ViewBuilder popupContent: () -> PopupContent) -> some View {
        modifier(PopupModifier(isPresented: isPresented, popupContent: popupContent))
    }
}

