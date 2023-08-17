//
//  HousesListViewModel.swift
//  AppOfFireAndIce
//
//  Created by Herman Willem Keuris on 2023/08/15.
//

import Foundation
import SwiftUI

extension HousesListView {
    class ViewModel: ObservableObject {
        var title: String
        var isLoading: Bool
        var pagination: PaginationModel
        var apiService: FireAndServiceService
        var cancelSearch: () -> Void
        @Published var model: [GoTHouseDto]
        
        init(title: String = "Houses", urls: [String]? = nil, request: GoTHouseRequest? = nil, cancelSearch: @escaping () -> () = {}) {
            self.title = title
            isLoading = false
            pagination = PaginationModel()
            apiService = FireAndServiceService()
            model = []
            self.cancelSearch = cancelSearch
            
            if (urls != nil && urls?.count ?? 0 > 0) {
                getHousesFromUrls(urls: urls)
            } else if (request != nil) {
                getHousesFromModel(request: request!)
            }
        }
        
        func getHousesFromModel(request: GoTHouseRequest) {
            isLoading = true
            
            var components = URLComponents(string: "\(EnvVars.baseUrl)\(FireAndServiceService.API.getHouses.path)")!
            components.queryItems = [
                URLQueryItem(name: "name", value: request.name ?? ""),
                URLQueryItem(name: "region", value: request.region ?? ""),
                URLQueryItem(name: "words", value: request.words ?? ""),
                URLQueryItem(name: "hasWords", value: request.hasWords?.description ?? ""),
                URLQueryItem(name: "hasTitles", value: request.hasTitles?.description ?? ""),
                URLQueryItem(name: "hasSeats", value: request.hasSeats?.description ?? ""),
                URLQueryItem(name: "hasDiedOut", value: request.hasDiedOut?.description ?? ""),
                URLQueryItem(name: "hasAncestralWeapons", value: request.hasAncestralWeapons?.description ?? ""),
                URLQueryItem(name: "page", value: request.page?.description ?? ""),
                URLQueryItem(name: "pageSize", value: request.pageSize?.description ?? "")
            ]
            do {
                let urlRequest = try apiService.urlRequest(url: components.url!)
                apiService.call(urlRequest: urlRequest) { (houses: [GoTHouseDto], pagination: PaginationModel) in
                    DispatchQueue.main.async{
                        self.model = houses
                        self.pagination = pagination
                        self.isLoading = false
                    }
                }
            } catch {
                isLoading = false
                // TODO: Handle error
            }
        }
        
        func getHousesFromUrls(urls: [String]?) {
            isLoading = true
            let dispatchGroup = DispatchGroup()

            urls?.forEach({ url in
                dispatchGroup.enter()
                do {
                    let request = try apiService.urlRequest(url: URL(string: url)!)
                    apiService.call(urlRequest: request) { (house: GoTHouseDto, pagination: PaginationModel) in
                        DispatchQueue.main.async{
                            self.model.append(house)
                            self.pagination = pagination
                            dispatchGroup.leave()
                        }
                    }
                } catch {
                    // TODO: Handle error
                }
            })
            
            dispatchGroup.notify(queue: .main) {
                self.isLoading = false
            }
        }
        
        func getHousesFromPaginationUrls(url: String){
            do {
                self.isLoading = true
                let request = try apiService.urlRequest(url: URL(string: url)!)
                apiService.call(urlRequest: request) { (houses: [GoTHouseDto], pagination: PaginationModel) in
                    DispatchQueue.main.async{
                        self.model = houses
                        self.pagination = pagination
                        self.isLoading = false
                    }
                }
            } catch {
                // TODO: Handle error
            }
        }
    }
}
