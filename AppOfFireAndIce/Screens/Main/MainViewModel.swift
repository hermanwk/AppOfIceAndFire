//
//  MainViewModel.swift
//  AppOfFireAndIce
//
//  Created by Herman Willem Keuris on 2023/08/16.
//

import Combine
import Foundation
import SwiftUI

extension MainView {
    class ViewModel: ObservableObject {
        @Published var selectedTab: PageEnum
        @Published var searchText: String
        @Published var booksRequest: GoTBookRequest
        @Published var charactersRequest: GoTCharacterRequest
        @Published var housesRequest: GoTHouseRequest
        
        private var subscriptions = Set<AnyCancellable>()
        
        init(selectedTab: PageEnum = PageEnum.houses, searchText: String = "", booksRequest: GoTBookRequest = GoTBookRequest(), charactersRequest: GoTCharacterRequest = GoTCharacterRequest(), housesRequest: GoTHouseRequest = GoTHouseRequest()) {
            self.selectedTab = selectedTab
            self.searchText = searchText
            self.booksRequest = booksRequest
            self.charactersRequest = charactersRequest
            self.housesRequest = housesRequest
        }
        
        func search() {
            switch selectedTab {
            case .books:
                self.booksRequest = GoTBookRequest(name: searchText)
                break
            case .characters:
                self.charactersRequest = GoTCharacterRequest(name: searchText)
                break
            case .houses:
                self.housesRequest = GoTHouseRequest(name: searchText)
                break
            }
        }
        
        func cancelSearch() {
            searchText = ""
            search()
        }
    }
}
