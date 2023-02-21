//
//  SheetPresenter.swift
//  FunctionalPopups
//
//  Created by Jenya Lebid on 2/18/23.
//

import SwiftUI

class SheetPresenter: ObservableObject {
    
    static var shared = SheetPresenter()
    
    struct Sheet: Identifiable, Equatable {
        var id: Int
        var view: any View
        
        static func == (lhs: SheetPresenter.Sheet, rhs: SheetPresenter.Sheet) -> Bool {
            lhs.id == rhs.id
        }
    }
 
    @Published var baseSheet: Sheet?
    @Published var nextSheet: Sheet?
        
    var sheetsActive = 0
    
    func addSheet(view: any View) {
        sheetsActive += 1
        DispatchQueue.main.async { [self] in
            if baseSheet == nil {
                baseSheet = Sheet(id: sheetsActive - 1, view: view)
            }
            else {
                nextSheet = Sheet(id: sheetsActive - 1, view: view)
            }
        }
    }
}


