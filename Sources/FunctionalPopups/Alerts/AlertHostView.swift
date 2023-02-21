//
//  AlertHostView.swift
//  FunctionalPopups
//
//  Created by Jenya Lebid on 2/18/23.
//

import SwiftUI
import UIKit

struct AlertHostView: View {
    
    @ObservedObject var alertPresenter = AlertPresenter.shared
    @State private var showAlert = false
    
    var body: some View {
        ZStack {
            if showAlert {
                if let alert = alertPresenter.currentAlert {
                    VStack {
                        Text(alert.title)
                            .font(.title2)
                        Divider()
                            .frame(width: 120)
                        Text(alert.message)
                            .multilineTextAlignment(.center)
                        Divider()
                            .padding(.bottom, 6)
                        if alert.actions.isEmpty {
                            dismiss(alert)
                        }
                        if alert.actions.count == 1 {
                            oneAction(alert)
                        }
                        else {
                            VStack {
                                
                            }
                        }
                    }
                    .padding()
                    .frame(width: 300)
                    .background(Color(uiColor: .systemBackground))
                    .cornerRadius(10)
                    .shadow(radius: 3)
                    .transition(.scale)

                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(showAlert ? Color.black.opacity(0.50) : Color.clear)
        .transition(.opacity)
        .onAppear {
            withAnimation {
                showAlert.toggle()
            }
        }
        .onChange(of: alertPresenter.currentAlert) { newValue in
            withAnimation {
                self.showAlert = newValue != nil ? true : false

            }
        }

    }
    
    func dismiss(_ alert: AppAlert) -> some View {
        AlertButton(text: alert.dismiss.text, width: 100, height: 50, background: .accentColor) {
            alert.dismiss.action()
        }
    }
    
    func oneAction(_ alert: AppAlert) -> some View {
        HStack {
            dismiss(alert)
            Divider()
                .frame(height: 20)
                .padding()
            AlertButton(text: alert.actions[0].text, width: 100, height: 50, background: color(alert.actions[0].role)) {
                alert.actions[0].action()
            }
        }
    }
    
    func color(_ type: AlertAction.AlertButtonRole) -> Color {
        switch type {
        case .destructive:
            return .red
        case .regular:
            return .accentColor
        case .dismiss:
            return .accentColor
        }
    }

}

struct AlertView_Previews: PreviewProvider {
    static var previews: some View {
        AlertHostView()
    }
}

//struct AlertHostView: View {
//
//    @ObservedObject var alertPresenter = AlertPresenter.shared
//    @State private var showAlert = false
//
//    var body: some View {
//        ZStack {
//            if showAlert {
//                VStack {
//                    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//                        .frame(width: 300, height: 300)
//                        .background(Color.cyan)
//                        .transition(.scale)
//                    Button("close") {
//                        withAnimation {
//                            showAlert.toggle()
//                        }
//                    }
//                    Button("add") {
//                        Popup.presentAlert()
//                    }
//                }
//                .transition(.scale)
//                .onDisappear {
//                    alertPresenter.showAlert.toggle()
//                    presentedC?.dismiss(animated: false)
//
//                }
//            }
//        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .background(showAlert ? Color.black.opacity(0.50) : Color.clear)
//        .transition(.opacity)
//        .onAppear {
//            withAnimation {
//                showAlert.toggle()
//            }
//        }
//        .onChange(of: alertPresenter.showAlert) { newValue in
//            withAnimation {
//                self.showAlert = newValue
//
//            }
//        }
//
//    }
//}


