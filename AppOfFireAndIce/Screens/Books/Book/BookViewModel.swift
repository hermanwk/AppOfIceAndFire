//
//  BookViewModel.swift
//  AppOfFireAndIce
//
//  Created by Herman Willem Keuris on 2023/08/10.
//

import Foundation
import SwiftUI

extension BookView {
    class ViewModel {
        var theme: AppTheme
        var model: GoTBookDto
        @Binding var navigationStack: Stack<PageModel>
        
        init(book: GoTBookDto, navigationStack: Binding<Stack<PageModel>>) {
            theme = AppTheme.preview
            self.model = book
            self._navigationStack = navigationStack
        }
    }
}
