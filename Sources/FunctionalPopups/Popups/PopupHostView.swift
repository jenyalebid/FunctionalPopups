//
//  PopupHostView.swift
//  FunctionalPopups
//
//  Created by Jenya Lebid on 3/11/23.
//

import SwiftUI

struct PopupHostView<PopupContent: View>: View {
    
    @Binding var isPresented: Bool
    
    @Binding var isPopupPresented: Bool
    @Binding var isControllerPresented: Bool
    
    var popupContent: PopupContent
    
    var body: some View {
        ZStack {
            if isPopupPresented {
                popupContent
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .onDisappear {
                        isControllerPresented = false
                    }
            }
        }
        .onAppear {
            withAnimation {
                isPopupPresented = true
            }
        }
        .onChange(of: isPresented) { presented in
            if !presented {
                withAnimation {
                    isPopupPresented = false
                }
            }
        }
    }
}
