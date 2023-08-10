//
//  ClickableRowViewModel.swift
//  AppOfFireAndIce
//
//  Created by Herman Willem Keuris on 2023/08/10.
//

import Foundation
import SwiftUI

extension ClickableRowView {
    class ViewModel {
        var theme: AppTheme
        var title: String
        var type: PageEnum
        var value: [String]
        var background: ColorName
        @Binding var navigationStack: Stack<PageModel>
        
        init(title: String, type: PageEnum, value: [String], background: ColorName = ColorName.orangePrimaryColor, navigationStack: Binding<Stack<PageModel>>) {
            theme = AppTheme.preview
            self.title = title
            self.type = type
            self.value = value
            self.background = background
            self._navigationStack = navigationStack
        }
        
        func navigate() {
            var title: String
            switch type {
            case .books:
                title = "Books"
                break
            case .characters:
                title = "Characters"
                break
            case .houses:
                title = "Houses"
                break
            case .home:
                title = "FireAndIce"
            }
            navigationStack.push(PageModel(title: title, type: type, urls: value))
        }
    }
}
