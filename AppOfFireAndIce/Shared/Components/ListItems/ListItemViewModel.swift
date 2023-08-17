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
        
        init(image: String, primaryTitle: String, primaryText: String, secondaryTitle: String = "", secondaryText: String = "") {
            self.image = image
            self.primaryTitle = primaryTitle
            self.primaryText = primaryText
            self.secondaryTitle = secondaryTitle
            self.secondaryText = secondaryText
        }
    }
}

