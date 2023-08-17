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
        
        func firstDisabled() -> Bool {
            return pagination.prev == "" || pagination.first == ""
        }
        
        func prevDisabled() -> Bool {
            return pagination.prev == ""
        }
        
        func displayPageNum() -> Bool {
            return pagination.prev == "" && pagination.first == "" && pagination.next == "" && pagination.last == ""
        }
        
        func nextDisabled() -> Bool {
            return pagination.next == ""
        }
        
        func lastDisabled() -> Bool {
            return pagination.next == "" || pagination.last == ""
        }
    }
}
