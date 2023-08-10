//
//  GoTObjectDto.swift
//  AppOfFireAndIce
//
//  Created by Herman Willem Keuris on 2023/08/09.
//

import Foundation

public protocol IGoTObjectRequest: Encodable {
    var page: Int? { get set }
    var pageSize: Int? { get set }
}

public protocol IGoTObjectDto: Codable, Hashable {
    var url: String? { get set }
    var name: String? { get set }
}
