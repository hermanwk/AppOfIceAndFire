//
//  ReadOnlyRowView.swift
//  AppOfFireAndIce
//
//  Created by Herman Willem Keuris on 2023/08/10.
//

import Foundation

extension ReadOnlyRowView {
    class ViewModel {
        var theme: AppTheme
        var title: String
        var value: String
        var background: ColorName
        
        init(title: String, value: String, background: ColorName = ColorName.orangePrimaryColor) {
            theme = AppTheme.preview
            self.title = title
            self.value = value
            self.background = background
        }
    }
}
