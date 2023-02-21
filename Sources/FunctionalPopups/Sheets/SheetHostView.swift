//
//  SheetHostView.swift
//  FunctionalPopups
//
//  Created by Jenya Lebid on 2/18/23.
//

import SwiftUI

struct SheetHostView: View {
    
    @ObservedObject var sheetPresenter = SheetPresenter.shared
    @StateObject var viewModel: SheetHostViewModel
    
    init(currentSheet: SheetPresenter.Sheet) {
        self._viewModel = StateObject(wrappedValue: SheetHostViewModel(currentSheet: currentSheet))
    }

    var body: some View {
        AnyView(viewModel.currentSheet.view)
            .sheet(item: $viewModel.nextSheet) { sheet in
                SheetHostView(currentSheet: sheet)
            }
            .onChange(of: sheetPresenter.nextSheet) { newValue in
                if newValue?.id == viewModel.index {
                    viewModel.nextSheet = newValue
                }
            }
            .onDisappear {
                viewModel.removeSheet()
            }
    }
}
