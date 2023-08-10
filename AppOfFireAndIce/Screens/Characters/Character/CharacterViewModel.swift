//
//  CharacterViewModel.swift
//  AppOfFireAndIce
//
//  Created by Herman Willem Keuris on 2023/08/10.
//

import Foundation
import SwiftUI

extension CharacterView {
    class ViewModel {
        var theme: AppTheme
        var model: GoTCharacterDto
        @Binding var navigationStack: Stack<PageModel>
        
        init(character: GoTCharacterDto, navigationStack: Binding<Stack<PageModel>>) {
            theme = AppTheme.preview
            self.model = character
            self._navigationStack = navigationStack
        }
    }
}
