//
//  NetworkError.swift
//  AppOfFireAndIce
//
//  Created by Herman Willem Keuris on 2023/08/16.
//

import Foundation

enum NetworkRequestError: Error {
    case api(_ status: Int, _ message: String, _ description: String)
    case unknown(Data?, URLResponse?)
}
