//
//  GoTBookDto.swift
//  AppOfFireAndIce
//
//  Created by Herman Willem Keuris on 2023/08/09.
//

import Foundation

struct GoTBookRequest: IGoTObjectRequest {
    var name: String?
    var fromReleaseDate: Date?
    var toReleaseDate: Date?
    var page: Int?
    var pageSize: Int?
}

struct GoTBookDto: IGoTObjectDto {
    var url: String?
    var name: String?
    var isbn: String?
    var authors: [String]?
    var numberOfPages: Int?
    var publisher: String?
    var country: String?
    var mediaType: String?
    var released: String?
    var characters: [String]?
    var povCharacters: [String]?
    
    enum CodingKeys: String, CodingKey {
        case url
        case name
        case isbn
        case authors
        case numberOfPages
        case publisher
        case country
        case mediaType
        case released
        case characters
        case povCharacters
    }

    init() {}
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.url = try container.decodeIfPresent(String.self, forKey: .url) ?? nil
        self.name = try container.decodeIfPresent(String.self, forKey: .name) ?? nil
        self.isbn = try container.decodeIfPresent(String.self, forKey: .isbn) ?? nil
        self.authors = try container.decodeIfPresent([String].self, forKey: .authors) ?? nil
        self.numberOfPages = try container.decodeIfPresent(Int.self, forKey: .numberOfPages) ?? nil
        self.publisher = try container.decodeIfPresent(String.self, forKey: .publisher) ?? nil
        self.country = try container.decodeIfPresent(String.self, forKey: .country) ?? nil
        self.mediaType = try container.decodeIfPresent(String.self, forKey: .mediaType) ?? nil
        self.released = try container.decodeIfPresent(String.self, forKey: .released) ?? nil
        self.characters = try container.decodeIfPresent([String].self, forKey: .characters) ?? nil
        self.povCharacters = try container.decodeIfPresent([String].self, forKey: .povCharacters) ?? nil
    }
}
