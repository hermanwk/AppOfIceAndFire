//
//  MainViewModel.swift
//  AppOfFireAndIce
//
//  Created by Herman Willem Keuris on 2023/08/10.
//

import Foundation
import SwiftUI

extension MainView {
    class ViewModel: ObservableObject {
        var theme: AppTheme
        @Published var isLoading: Bool
        
        init() {
            isLoading = false
            theme = AppTheme.preview
        }
    }
}
