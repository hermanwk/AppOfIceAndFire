//
//  FireAndIceService.swift
//  AppOfFireAndIce
//
//  Created by Herman Willem Keuris on 2023/08/09.
//

import Combine
import Foundation
import SwiftUI

struct FireAndServiceService {
    let method: String = "GET"
    var currentPagination: PaginationModel = PaginationModel()
    
    init() {}
    
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
    
    private func setCurrentPagination(response: HTTPURLResponse?) -> PaginationModel {
        let linkHeader = response?.allHeaderFields["Link"]
        if (linkHeader != nil) {
            let links = (linkHeader as AnyObject).components(separatedBy: ",")
            var linksDictionary: [String: String] = [:]
            links.forEach({
                let components = $0.components(separatedBy:"; ")
                var cleanPath = components[0].trimmingCharacters(in: CharacterSet(charactersIn: "<>"))
                cleanPath = cleanPath.replacingOccurrences(of: " ", with: "")
                linksDictionary[components[1]] = cleanPath.replacingOccurrences(of: "<", with: "")
            })
            
            var pageInt = -1
            let next = linksDictionary["rel=\"next\""] ?? ""
            
            if (next == "") {
                let last = linksDictionary["rel=\"last\""] ?? ""
                pageInt = (Int(URL(string: last)?.valueOf("page") ?? "") ?? 1)
            } else {
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

extension FireAndServiceService {
    enum API {
        case getBooks
        case getCharacters
        case getHouses
    }
}

extension FireAndServiceService.API {
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
