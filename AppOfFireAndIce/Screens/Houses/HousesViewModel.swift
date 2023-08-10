//
//  HousesViewModel.swift
//  AppOfFireAndIce
//
//  Created by Herman Willem Keuris on 2023/08/09.
//

import Foundation
import SwiftUI

extension HousesView {
    class ViewModel: ObservableObject {
        var theme: AppTheme
        var isLoading: Bool
        var pagination: PaginationModel
        var apiService: FireAndServiceService
        @Published var model: [GoTHouseDto]
        @Binding var navigationStack: Stack<PageModel>
        
        init(urls: [String]? = nil, navigationStack: Binding<Stack<PageModel>>) {
            theme = AppTheme.preview
            isLoading = false
            pagination = PaginationModel()
            apiService = FireAndServiceService()
            model = []
            self._navigationStack = navigationStack
            
            
            if (urls != nil && urls?.count ?? 0 > 0) {
                getHouseUrls(urls: urls)
            } else {
                getHouses(request: GoTHouseRequest())
            }
        }
        
        func getHouses(request: GoTHouseRequest) {
            isLoading = true
            
            var components = URLComponents(string: "\(EnvVars.baseUrl)\(FireAndServiceService.API.getHouses.path)")!
            components.queryItems = [
                URLQueryItem(name: "name", value: request.name),
                URLQueryItem(name: "region", value: request.region),
                URLQueryItem(name: "words", value: request.words),
                URLQueryItem(name: "hasWords", value: request.hasWords?.description),
                URLQueryItem(name: "hasTitles", value: request.hasTitles?.description),
                URLQueryItem(name: "hasSeats", value: request.hasSeats?.description),
                URLQueryItem(name: "hasDiedOut", value: request.hasDiedOut?.description),
                URLQueryItem(name: "hasAncestralWeapons", value: request.hasAncestralWeapons?.description),
                URLQueryItem(name: "page", value: request.page?.description),
                URLQueryItem(name: "pageSize", value: request.pageSize?.description)
            ]
            do {
                let request = try apiService.urlRequest(url: components.url!)
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
        
        func getHouseUrls(urls: [String]?) {
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
        
        func navigatePagination(url: String){
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

