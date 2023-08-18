//
//  GoTCharacterDto.swift
//  AppOfFireAndIce
//
//  Created by Herman Willem Keuris on 2023/08/09.
//

import Foundation

struct GoTCharacterRequest: Codable, Equatable {
    var name: String?
    var gender: String?
    var culture: String?
    var born: String?
    var died: String?
    var isAlive: Bool?
    var page: Int?
    var pageSize: Int?
}

struct GoTCharacterDto: Codable, Hashable {
    var url: String?
    var name: String?
    var gender: String?
    var culture: String?
    var born: String?
    var died: String?
    var titles: [String]?
    var aliases: [String]?
    var father: String?
    var mother: String?
    var spouse: String?
    var allegiances: [String]?
    var books: [String]?
    var povBooks: [String]?
    var tvSeries: [String]?
    var playedBy: [String]?
    
    enum CodingKeys: String, CodingKey {
        case url
        case name
        case gender
        case culture
        case born
        case died
        case titles
        case aliases
        case father
        case mother
        case spouse
        case allegiances
        case books
        case povBooks
        case tvSeries
        case playedBy
    }
    
    init(url: String? = "", name: String? = "", gender: String? = "", culture: String? = "", born: String? = "", died: String? = "", titles: [String]? = [], aliases: [String]? = [], father: String? = "", mother: String? = "", spouse: String? = "", allegiances: [String]? = [], books: [String]? = [], povBooks: [String]? = [], tvSeries: [String]? = [], playedBy: [String]? = []) {
        self.url = url
        self.name = name
        self.gender = gender
        self.culture = culture
        self.born = born
        self.died = died
        self.titles = titles
        self.aliases = aliases
        self.father = father
        self.mother = mother
        self.spouse = spouse
        self.allegiances = allegiances
        self.books = books
        self.povBooks = povBooks
        self.tvSeries = tvSeries
        self.playedBy = playedBy
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.url = try container.decodeIfPresent(String.self, forKey: .url) ?? nil
        self.name = try container.decodeIfPresent(String.self, forKey: .name) ?? nil
        self.gender = try container.decodeIfPresent(String.self, forKey: .gender) ?? nil
        self.culture = try container.decodeIfPresent(String.self, forKey: .culture) ?? nil
        self.born = try container.decodeIfPresent(String.self, forKey: .born) ?? nil
        self.died = try container.decodeIfPresent(String.self, forKey: .died) ?? nil
        self.titles = try container.decodeIfPresent([String].self, forKey: .titles) ?? nil
        self.aliases = try container.decodeIfPresent([String].self, forKey: .aliases) ?? nil
        self.father = try container.decodeIfPresent(String.self, forKey: .father) ?? nil
        self.mother = try container.decodeIfPresent(String.self, forKey: .mother) ?? nil
        self.spouse = try container.decodeIfPresent(String.self, forKey: .spouse) ?? nil
        self.allegiances = try container.decodeIfPresent([String].self, forKey: .allegiances) ?? nil
        self.books = try container.decodeIfPresent([String].self, forKey: .books) ?? nil
        self.povBooks = try container.decodeIfPresent([String].self, forKey: .povBooks) ?? nil
        self.tvSeries = try container.decodeIfPresent([String].self, forKey: .tvSeries) ?? nil
        self.playedBy = try container.decodeIfPresent([String].self, forKey: .playedBy) ?? nil
    }
}
