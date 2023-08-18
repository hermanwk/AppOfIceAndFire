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
        var apiService: FireAndIceService
        @Published var model: [GoTHouseDto]
        var cancelSearch: () -> Void
        
        /// HousesListView.ViewModel initializer
        /// - Parameters:
        ///   - title: The title to be displayed in the Navigation Bar
        ///   - urls: A list of urls to be called to get a list of houses
        ///   - request: A request object which can be used to get a filtered list of houses
        ///   - cancelSearch: A method to be called when cancelling the search filtering of houses
        init(title: String = "Houses", urls: [String]? = nil, request: GoTHouseRequest? = nil, cancelSearch: @escaping () -> () = {}) {
            self.title = title
            isLoading = false
            pagination = PaginationModel()
            apiService = FireAndIceService()
            model = []
            self.cancelSearch = cancelSearch
            
            if (urls != nil && urls?.count ?? 0 > 0) {
                getHousesFromUrls(urls: urls)
            } else if (request != nil) {
                getHousesFromModel(request: request!)
            }
        }
        
        /// Get a filtered list of houses from a request object
        /// - Parameter request: A `GoTHouseRequest` object which is  used to filter for specific houses
        func getHousesFromModel(request: GoTHouseRequest) {
            isLoading = true
            
            var components = URLComponents(string: "\(EnvVars.baseUrl)\(FireAndIceService.API.getHouses.path)")!
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
            }
        }
        
        /// Get a  list of houses from a list of urls
        /// - Parameter urls: A list of urls to be called to construct a list of houses
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
                    isLoading = false
                }
            })
            
            dispatchGroup.notify(queue: .main) {
                self.isLoading = false
            }
        }
        
        /// Get a  list of houses from a list of urls provided by a `PaginationModel`
        /// - Parameter url: A url provided by a `PaginationModel` used to get a list of houses
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
                isLoading = false
            }
        }
    }
}
