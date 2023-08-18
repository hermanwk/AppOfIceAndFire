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
        
        /// MainView.ViewModel initializer
        /// - Parameters:
        ///   - selectedTab: Currently selected tab
        ///   - searchText: Search term used to search for specific books, characters or houses
        ///   - booksRequest: A request object used to search for specific books
        ///   - charactersRequest: A request object used to search for specific characters
        ///   - housesRequest: A request object used to search for specific houses
        init(selectedTab: PageEnum = PageEnum.houses, searchText: String = "", booksRequest: GoTBookRequest = GoTBookRequest(), charactersRequest: GoTCharacterRequest = GoTCharacterRequest(), housesRequest: GoTHouseRequest = GoTHouseRequest()) {
            self.selectedTab = selectedTab
            self.searchText = searchText
            self.booksRequest = booksRequest
            self.charactersRequest = charactersRequest
            self.housesRequest = housesRequest
        }
        
        /// Construct a request object to be used to make a GET call to get a  list of either books,  characters or houses
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
        
        /// Resets the variables used to make a search of all books,  characters or houses
        func cancelSearch() {
            searchText = ""
            search()
        }
    }
}
