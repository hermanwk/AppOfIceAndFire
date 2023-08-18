//
//  ListItemViewModel.swift
//  AppOfFireAndIce
//
//  Created by Herman Willem Keuris on 2023/08/15.
//

import Foundation
import SwiftUI

extension ListItemView {
    class ViewModel: ObservableObject {
        var image: String
        var primaryTitle: String
        var primaryText: String
        var secondaryTitle: String
        var secondaryText: String
        
        /// ListItemView.ViewModel initializer
        /// - Parameters:
        ///   - image: The name of a icon to be displayed at the start of the list item
        ///   - primaryTitle: The label of the primary text value to be displayed
        ///   - primaryText: The primary text value to be displayed
        ///   - secondaryTitle: The label of the secondary text value to be displayed
        ///   - secondaryText: The secondary text value to be displayed
        init(image: String = "", primaryTitle: String, primaryText: String, secondaryTitle: String = "", secondaryText: String = "") {
            self.image = image
            self.primaryTitle = primaryTitle
            self.primaryText = primaryText
            self.secondaryTitle = secondaryTitle
            self.secondaryText = secondaryText
        }
    }
}

