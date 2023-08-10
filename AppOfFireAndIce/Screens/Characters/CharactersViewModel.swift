//
//  CharactersViewModel.swift
//  AppOfFireAndIce
//
//  Created by Herman Willem Keuris on 2023/08/09.
//

import Foundation
import SwiftUI

extension CharactersView {
    class ViewModel: ObservableObject {
        var theme: AppTheme
        var isLoading: Bool
        var pagination: PaginationModel
        var apiService: FireAndServiceService
        
        @Published var model: [GoTCharacterDto]
        @Binding var navigationStack: Stack<PageModel>
        
        init(urls: [String]? = nil, navigationStack: Binding<Stack<PageModel>>) {
            theme = AppTheme.preview
            isLoading = false
            pagination = PaginationModel()
            apiService = FireAndServiceService()
            model = []
            self._navigationStack = navigationStack
            
            if (urls != nil && urls?.count ?? 0 > 0) {
                getCharacterUrls(urls: urls)
            } else {
                getCharacters(request: GoTCharacterRequest())
            }
        }
        
        func getCharacters(request: GoTCharacterRequest) {
            isLoading = true
            
            var components = URLComponents(string: "\(EnvVars.baseUrl)\(FireAndServiceService.API.getCharacters.path)")!
            components.queryItems = [
                URLQueryItem(name: "name", value: request.name),
                URLQueryItem(name: "gender", value: request.gender),
                URLQueryItem(name: "culture", value: request.culture),
                URLQueryItem(name: "born", value: request.born),
                URLQueryItem(name: "died", value: request.died),
                URLQueryItem(name: "isAlive", value: request.isAlive?.description),
                URLQueryItem(name: "page", value: request.page?.description),
                URLQueryItem(name: "pageSize", value: request.pageSize?.description)
            ]
            
            do {
                let request = try apiService.urlRequest(url: components.url!)
                apiService.call(urlRequest: request) { (characters: [GoTCharacterDto], pagination: PaginationModel) in
                    DispatchQueue.main.async{
                        self.model = characters
                        self.pagination = pagination
                        self.isLoading = false
                    }
                }
            } catch {
                // TODO: Handle error
            }
        }
        
        func getCharacterUrls(urls: [String]?) {
            isLoading = true
            let dispatchGroup = DispatchGroup()

            urls?.forEach({ url in
                do {
                    let request = try apiService.urlRequest(url: URL(string: url)!)
                    dispatchGroup.enter()
                    apiService.call(urlRequest: request) { (character: GoTCharacterDto, pagination: PaginationModel) in
                        DispatchQueue.main.async{
                            self.model.append(character)
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
                apiService.call(urlRequest: request) { (characters: [GoTCharacterDto], pagination: PaginationModel) in
                    DispatchQueue.main.async{
                        self.model = characters
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

