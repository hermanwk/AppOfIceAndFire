//
//  PaginationFooterViewModel.swift
//  AppOfFireAndIce
//
//  Created by Herman Willem Keuris on 2023/08/10.
//

import Foundation
import SwiftUI

extension PaginationFooterView {
    class ViewModel {
        var theme: AppTheme
        var callback: (_ url: String) -> ()
        @Binding var pagination: PaginationModel
        
        init(callback: @escaping (_ url: String) -> (), pagination: Binding<PaginationModel>) {
            theme = AppTheme.preview
            self.callback = callback
            self._pagination = pagination
        }
    }
}
