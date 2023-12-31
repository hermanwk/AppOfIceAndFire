//
//  ThreeStateToggleViewModel.swift
//  AppOfFireAndIce
//
//  Created by Herman Willem Keuris on 2023/08/16.
//

import Foundation
import SwiftUI

extension ThreeStateToggleView {
    class ViewModel: ObservableObject {
        var label: String
        var firstOption: String
        var secondOption: String
        @Binding var value: Int
        
        
        /// ThreeStateToggleView.ViewModel initializer
        /// - Parameters:
        ///   - label: The label of the three state toggle input component
        ///   - firstOption: The label of the first option
        ///   - secondOption: The label of the second option
        ///   - value: The returned selected value
        init(label: String = "", firstOption: String = "True", secondOption: String = "False", value: Binding<Int>) {
            self.label = label
            self.firstOption = firstOption
            self.secondOption = secondOption
            self._value = value
        }
    }
}
