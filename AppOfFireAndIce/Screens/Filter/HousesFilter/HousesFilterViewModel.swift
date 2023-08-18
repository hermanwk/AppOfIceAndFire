//
//  HousesFilterViewModel.swift
//  AppOfFireAndIce
//
//  Created by Herman Willem Keuris on 2023/08/16.
//

import Foundation
import SwiftUI

extension HousesFilterView {
    class ViewModel: ObservableObject {
        @Published var name: String
        @Published var region: String
        @Published var words: String
        @Published var hasWords: Int
        @Published var hasTitles: Int
        @Published var hasSeats: Int
        @Published var hasDiedOut: Int
        @Published var hasAncestralWeapons: Int
        var page: Int?
        var pageSize: Int?
        
        /// HousesFilterView.ViewModel initializer
        /// - Parameters:
        ///   - name: Filter by the name of the house(s)
        ///   - region: Filter by the region where the house(s) is/are located
        ///   - words: Filter by the words of the house
        ///   - hasWords: Filter by whether houses have words or not
        ///   - hasTitles: Filter by whether houses have titles or not
        ///   - hasSeats: Filter by whether houses have seats or not
        ///   - hasDiedOut: Filter by whether houses have died out or not
        ///   - hasAncestralWeapons: Filter by whether houses have ancestral weapons or not
        ///   - page: The current page of pagination
        ///   - pageSize: The number of items per page of pagination
        init(name: String = "", region: String = "", words: String = "", hasWords: Int = 0, hasTitles: Int = 0, hasSeats: Int = 0, hasDiedOut: Int = 0, hasAncestralWeapons: Int = 0, page: Int? = nil, pageSize: Int? = nil) {
            self.name = name
            self.region = region
            self.words = words
            self.hasWords = hasWords
            self.hasTitles = hasTitles
            self.hasSeats = hasSeats
            self.hasDiedOut = hasDiedOut
            self.hasAncestralWeapons = hasAncestralWeapons
            self.page = page
            self.pageSize = pageSize
        }
        
        /// Construct a `GoTHouseRequest` object to be used to make a GET call to get a filtered list of houses
        /// - Returns: The `GoTHouseRequest` object to be used in the GET call
        func getRequest() -> GoTHouseRequest {
            var hasWordsBool: Bool? = nil
            if (self.hasWords == 1) {
                hasWordsBool = true
            } else if (self.hasWords == 2) {
                hasWordsBool = false
            }
            
            var hasTitlesBool: Bool? = nil
            if (self.hasTitles == 1) {
                hasTitlesBool = true
            } else if (self.hasTitles == 2) {
                hasTitlesBool = false
            }
            
            var hasSeatsBool: Bool? = nil
            if (self.hasSeats == 1) {
                hasSeatsBool = true
            } else if (self.hasSeats == 2) {
                hasSeatsBool = false
            }
            
            var hasDiedOutBool: Bool? = nil
            if (self.hasDiedOut == 1) {
                hasDiedOutBool = true
            } else if (self.hasDiedOut == 2) {
                hasDiedOutBool = false
            }
            
            var hasAncestralWeaponsBool: Bool? = nil
            if (self.hasAncestralWeapons == 1) {
                hasAncestralWeaponsBool = true
            } else if (self.hasAncestralWeapons == 2) {
                hasAncestralWeaponsBool = false
            }
            
            return GoTHouseRequest(
                name: self.name == "" ? nil : self.name,
                region: self.region == "" ? nil : self.name,
                words: self.words == "" ? nil : self.name,
                hasWords: hasWordsBool,
                hasTitles: hasTitlesBool,
                hasSeats: hasSeatsBool,
                hasDiedOut: hasDiedOutBool,
                hasAncestralWeapons: hasAncestralWeaponsBool,
                page: self.page,
                pageSize: self.pageSize
            )
        }
    }
}
