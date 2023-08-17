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
        
        init(selectedTab: PageEnum = PageEnum.houses) {
            self.selectedTab = selectedTab
        }
        
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
