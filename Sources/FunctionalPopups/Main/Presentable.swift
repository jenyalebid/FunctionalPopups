//
//  Presentable.swift
//  FunctionalPopups
//
//  Created by Jenya Lebid on 2/18/23.
//

import SwiftUI

public struct Presentable: ViewModifier {
    
    @ObservedObject var sheetPresenter = SheetPresenter.shared
    @ObservedObject var alertPresenter = AlertPresenter.shared
    
    public init() {}
    
    public func body(content: Content) -> some View {
        content
            .sheet(item: $sheetPresenter.baseSheet, content: { sheet in
                SheetHostView(currentSheet: sheet)
            })
            .overlay {
                if alertPresenter.currentAlert != nil {
                    AlertRepresentable()
                }
            }
            .ignoresSafeArea()
    }
}

public extension View {
    
    func presentable() -> some View {
        self
            .modifier(Presentable())
    }
}

//struct AppHostView_Previews: PreviewProvider {
//    static var previews: some View {
//        WindowHost {
//            Text("Main View")
//        }
//    }
//}
