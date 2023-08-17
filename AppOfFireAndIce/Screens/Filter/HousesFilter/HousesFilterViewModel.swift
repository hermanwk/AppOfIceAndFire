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
