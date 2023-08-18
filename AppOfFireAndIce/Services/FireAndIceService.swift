//
//  FireAndIceService.swift
//  AppOfFireAndIce
//
//  Created by Herman Willem Keuris on 2023/08/09.
//

import Combine
import Foundation
import SwiftUI

struct FireAndIceService {
    let method: String = "GET"
    
    init() {}
    
    /// Add headers to construct the url request from the given `url`
    /// - Parameter url: The url of the specified GET call.
    /// - Returns: A URLRequest from the given `url`
    func urlRequest(url: URL) throws -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method
        var newHeaders = [String: String]()
        newHeaders["Accept"] = "application/json"
        newHeaders["Content-Type"] = "application/json"
        newHeaders["Platform"] = "ios"
        request.allHTTPHeaderFields = newHeaders
        return request
    }
    
    /// Extract pagination info from the headers of the `response` of a HTTP call
    /// - Parameter response: The response from the GET call, including headers
    /// - Returns: A PaginationModel which can be used to page through a list of returned values
    private func setCurrentPagination(response: HTTPURLResponse?) -> PaginationModel {
        let linkHeader = response?.allHeaderFields["Link"]
        if (linkHeader != nil) {
            let links = (linkHeader as AnyObject).components(separatedBy: ",")
            var linksDictionary: [String: String] = [:]
            links.forEach({
                let components = $0.components(separatedBy:"; ")
                if (components.count > 1) {
                    var cleanPath = components[0].trimmingCharacters(in: CharacterSet(charactersIn: "<>"))
                    cleanPath = cleanPath.replacingOccurrences(of: " ", with: "")
                    linksDictionary[components[1]] = cleanPath.replacingOccurrences(of: "<", with: "")
                }
            })
            
            var pageInt = -1
            let next = linksDictionary["rel=\"next\""] ?? ""
            
            if (next == "") {
                // If no "next" value is returned then we are currently on the last page
                let last = linksDictionary["rel=\"last\""] ?? ""
                pageInt = (Int(URL(string: last)?.valueOf("page") ?? "") ?? 1)
            } else {
                // Otherwise use the "next" value to get the current page
                pageInt = (Int(URL(string: next)?.valueOf("page") ?? "") ?? 2) - 1
            }
            
            let pagination = PaginationModel(
                prev: linksDictionary["rel=\"prev\""] ?? "",
                next: linksDictionary["rel=\"next\""] ?? "",
                first: linksDictionary["rel=\"first\""] ?? "",
                last: linksDictionary["rel=\"last\""] ?? "",
                currentPage: String(pageInt)
            )
            
            return pagination
        } else {
            return PaginationModel()
        }
    }
    
    /// Generic GET call
    /// - Parameters:
    ///   - urlRequest: The URLRequest of the GET call to be made
    ///   - completionHandler: The completionHandler returns a generic decodable `Value` as well as a `PaginationModel` to page through the returned `Value` if that `Value` is an array
    func call<Value: Decodable>(urlRequest: URLRequest, completionHandler: @escaping (Value, PaginationModel) -> Void) {
        URLSession.shared.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
          if let error = error {
            print("Error with calling api: \(error)")
            return
          }
          
          guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode) else {
              print("Error with the response, unexpected status code: \(String(describing: response))")
            return
          }
            
          let pagination = setCurrentPagination(response: response as? HTTPURLResponse)

          if let data = data,
            let decodedResponse = try? JSONDecoder().decode(Value.self, from: data) {
            completionHandler(decodedResponse, pagination)
          }
        }).resume()
      }
}

extension FireAndIceService {
    enum API {
        case getBooks
        case getCharacters
        case getHouses
    }
}

extension FireAndIceService.API {
    var path: String {
        switch self {
        case .getBooks:
            return "/books/"
        case .getCharacters:
            return "/characters/"
        case .getHouses:
            return "/houses/"
        }
    }
}
