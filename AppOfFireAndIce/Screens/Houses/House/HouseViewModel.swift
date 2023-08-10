//
//  HouseViewModel.swift
//  AppOfFireAndIce
//
//  Created by Herman Willem Keuris on 2023/08/10.
//

import Foundation
import SwiftUI

extension HouseView {
    class ViewModel {
        var theme: AppTheme
        var model: GoTHouseDto
        @Binding var navigationStack: Stack<PageModel>
        
        init(house: GoTHouseDto, navigationStack: Binding<Stack<PageModel>>) {
            theme = AppTheme.preview
            self.model = house
            self._navigationStack = navigationStack
        }
    }
}
