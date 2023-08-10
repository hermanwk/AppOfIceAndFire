//
//  GoTHouseDto.swift
//  AppOfFireAndIce
//
//  Created by Herman Willem Keuris on 2023/08/09.
//

import Foundation

struct GoTHouseRequest: IGoTObjectRequest {
    var name: String?
    var region: String?
    var words: String?
    var hasWords: Bool?
    var hasTitles: Bool?
    var hasSeats: Bool?
    var hasDiedOut: Bool?
    var hasAncestralWeapons: Bool?
    var page: Int?
    var pageSize: Int?
}

struct GoTHouseDto: IGoTObjectDto {
    var url: String?
    var name: String?
    var region: String?
    var coatOfArms: String?
    var words: String?
    var titles: [String]?
    var seats: [String]?
    var currentLord: String?
    var heir: String?
    var overlord: String?
    var founded: String?
    var founder: String?
    var diedOut: String?
    var ancestralWeapons: [String]?
    var cadetBranches: [String]?
    var swornMembers: [String]?
    
    enum CodingKeys: String, CodingKey {
        case url
        case name
        case region
        case coatOfArms
        case words
        case titles
        case seats
        case currentLord
        case heir
        case overlord
        case founded
        case founder
        case diedOut
        case ancestralWeapons
        case cadetBranches
        case swornMembers
    }
    
    init() {}
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.url = try container.decodeIfPresent(String.self, forKey: .url) ?? nil
        self.name = try container.decodeIfPresent(String.self, forKey: .name) ?? nil
        self.region = try container.decodeIfPresent(String.self, forKey: .region) ?? nil
        self.coatOfArms = try container.decodeIfPresent(String.self, forKey: .coatOfArms) ?? nil
        self.words = try container.decodeIfPresent(String.self, forKey: .words) ?? nil
        self.titles = try container.decodeIfPresent([String].self, forKey: .titles) ?? nil
        self.seats = try container.decodeIfPresent([String].self, forKey: .seats) ?? nil
        self.currentLord = try container.decodeIfPresent(String.self, forKey: .currentLord) ?? nil
        self.heir = try container.decodeIfPresent(String.self, forKey: .heir) ?? nil
        self.overlord = try container.decodeIfPresent(String.self, forKey: .overlord) ?? nil
        self.founded = try container.decodeIfPresent(String.self, forKey: .founded) ?? nil
        self.founder = try container.decodeIfPresent(String.self, forKey: .founder) ?? nil
        self.diedOut = try container.decodeIfPresent(String.self, forKey: .diedOut) ?? nil
        self.ancestralWeapons = try container.decodeIfPresent([String].self, forKey: .ancestralWeapons) ?? nil
        self.cadetBranches = try container.decodeIfPresent([String].self, forKey: .cadetBranches) ?? nil
        self.swornMembers = try container.decodeIfPresent([String].self, forKey: .swornMembers) ?? nil
    }
}
