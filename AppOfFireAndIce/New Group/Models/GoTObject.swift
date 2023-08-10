//
//  GoTObject.swift
//  AppOfFireAndIce
//
//  Created by Herman Willem Keuris on 2023/08/09.
//

import Foundation

public protocol IGoTObject: Codable {
    var isLoaded: Bool { get set }
    var url: String? { get set }
}
