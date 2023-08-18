//
//  MainFilterViewModel.swift
//  AppOfFireAndIce
//
//  Created by Herman Willem Keuris on 2023/08/16.
//

import Combine
import Foundation
import SwiftUI

extension MainFilterView {
    class ViewModel: ObservableObject {
        @Published var selectedTab: PageEnum
        
        /// <#Description#>
        /// - Parameter selectedTab: <#selectedTab description#>
        init(selectedTab: PageEnum = PageEnum.houses) {
            self.selectedTab = selectedTab
        }
        
        /// Returns a label for each of the `PageEnum` types
        /// - Returns: The `String` which can be used as a label for a specific `PageEnum` type
        func getSearchType() -> String {
            switch selectedTab {
            case .houses:
                return "Houses"
            case .books:
                return "Books"
            case .characters:
                return "Characters"
            }
        }
    }
}
