//
//  SheetHostViewModel.swift
//  FunctionalPopups
//
//  Created by Jenya Lebid on 2/18/23.
//

import Foundation

class SheetHostViewModel: ObservableObject {
    
    var index = SheetPresenter.shared.sheetsActive
    var currentSheet: SheetPresenter.Sheet
    
    @Published var nextSheet: SheetPresenter.Sheet?
    
    init(currentSheet: SheetPresenter.Sheet) {
        self.currentSheet = currentSheet
    }
    
    func removeSheet() {
        SheetPresenter.shared.sheetsActive -= 1
        SheetPresenter.shared.nextSheet = nil
        if SheetPresenter.shared.sheetsActive == 0 {
            SheetPresenter.shared.baseSheet = nil
        }
    }
}
