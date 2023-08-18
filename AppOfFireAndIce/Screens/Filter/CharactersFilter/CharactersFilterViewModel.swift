//
//  CharactersFilterViewModel.swift
//  AppOfFireAndIce
//
//  Created by Herman Willem Keuris on 2023/08/16.
//

import Foundation
import SwiftUI

extension CharactersFilterView {
    class ViewModel: ObservableObject {
        @Published var name: String
        @Published var gender: Int
        @Published var culture: String
        @Published var born: String
        @Published var died: String
        @Published var isAlive: Int
        var page: Int?
        var pageSize: Int?
        
        /// CharactersFilterView.ViewModel initializer
        /// - Parameters:
        ///   - name: Filter by name of the character(s)
        ///   - gender: Filter by gender of the character(s)
        ///   - culture: Filter by the culture of the character(s)
        ///   - born: Filter by characters born this year
        ///   - died: Filter by characters that have died this year
        ///   - isAlive: Filter by characters that are either currently alive or dead
        ///   - page: The current page of pagination
        ///   - pageSize: The number of items per page of pagination
        init(name: String = "", gender: Int = 0, culture: String = "", born: String = "", died: String = "", isAlive: Int = 0, page: Int? = nil, pageSize: Int? = nil) {
            self.name = name
            self.gender = gender
            self.culture = culture
            self.born = born
            self.died = died
            self.isAlive = isAlive
            self.page = page
            self.pageSize = pageSize
        }
        
        /// Construct a `GoTCharacterRequest` object to be used to make a GET call to get a filtered list of characters
        /// - Returns: The `GoTCharacterRequest` object to be used in the GET call
        func getRequest() -> GoTCharacterRequest {
            var genderString: String? = nil
            if (self.gender == 1) {
                genderString = "Male"
            } else if (self.gender == 2) {
                genderString = "Female"
            }
            
            var isAliveBool: Bool? = nil
            if (self.isAlive == 1) {
                isAliveBool = true
            } else if (self.isAlive == 2) {
                isAliveBool = false
            }
            
            return GoTCharacterRequest(
                name: self.name == "" ? nil : self.name,
                gender: genderString,
                culture: self.culture == "" ? nil : self.culture,
                born: self.born == "" ? nil : self.born,
                died: self.died == "" ? nil : self.died,
                isAlive: isAliveBool,
                page: self.page,
                pageSize: self.pageSize
            )
        }
    }
}

