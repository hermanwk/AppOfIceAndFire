//
//  HomeViewModel.swift
//  AppOfFireAndIce
//
//  Created by Herman Willem Keuris on 2023/08/09.
//

import Foundation
import SwiftUI

extension HomeView {
    class ViewModel: ObservableObject {
        var theme: AppTheme
        @Binding var navigationStack: Stack<PageModel>
        
        init(navigationStack: Binding<Stack<PageModel>>) {
            theme = AppTheme.preview
            self._navigationStack = navigationStack
        }
        
        func navigate(page: PageEnum) {
            var title: String
            switch page {
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
            navigationStack.push(PageModel(title: title, type: page))
        }
    }
}
