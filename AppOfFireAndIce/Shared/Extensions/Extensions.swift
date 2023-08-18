//
//  Extensions.swift
//  AppOfFireAndIce
//
//  Created by Herman Willem Keuris on 2023/08/10.
//

import Foundation

extension URL {
    
    /// Returns the value of a specified query parameter in a `URL` object
    /// - Parameter queryParameterName: The specific query parameter to be returned
    /// - Returns: The value of the specified query parameter returned as a `String`
    func valueOf(_ queryParameterName: String) -> String? {
        guard let url = URLComponents(string: self.absoluteString) else { return nil }
        return url.queryItems?.first(where: { $0.name == queryParameterName })?.value
    }
}
