//
//  CharactersListViewModel.swift
//  AppOfFireAndIce
//
//  Created by Herman Willem Keuris on 2023/08/16.
//

import SwiftUI

extension CharactersListView {
    class ViewModel: ObservableObject {
        var theme: AppTheme
        var title: String
        var isLoading: Bool
        var pagination: PaginationModel
        var apiService: FireAndServiceService
        var cancelSearch: () -> Void
        @Published var model: [GoTCharacterDto]
        
        init(title: String = "Characters", urls: [String]? = nil, request: GoTCharacterRequest? = nil, cancelSearch: @escaping () -> () = {}) {
            theme = AppTheme.preview
            self.title = title
            isLoading = false
            pagination = PaginationModel()
            apiService = FireAndServiceService()
            model = []
            self.cancelSearch = cancelSearch
            
            if (urls != nil && urls?.count ?? 0 > 0) {
                getCharactersFromUrls(urls: urls)
            } else if (request != nil) {
                getCharactersFromModel(request: request!)
            } else {
                getCharactersFromModel(request: GoTCharacterRequest())
            }
        }
        
        func getCharactersFromModel(request: GoTCharacterRequest) {
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
                self.isLoading = false
                // TODO: Handle error
            }
        }
        
        func getCharactersFromUrls(urls: [String]?) {
            isLoading = true
            let dispatchGroup = DispatchGroup()

            urls?.forEach({ url in
                dispatchGroup.enter()
                do {
                    let request = try apiService.urlRequest(url: URL(string: url)!)
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
        
        func getCharactersFromPaginationUrls(url: String){
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
                self.isLoading = false
                // TODO: Handle error
            }
        }
        
        func getPrimaryTitleText(character: GoTCharacterDto) -> [String] {
            if (!(character.name?.isEmpty ?? true)) {
                return ["Name", character.name ?? ""]
            } else {
                return ["Aliases", character.aliases?.joined(separator:", ") ?? ""]
            }
        }
        
        func getSecondaryTitleText(character: GoTCharacterDto) -> [String] {
            if (!(character.name?.isEmpty ?? true) && !(character.aliases?.count ?? 0 > 0)) {
                return ["Aliases", character.aliases?.joined(separator:", ") ?? ""]
            } else if (!(character.titles?.count ?? 0 > 0)) {
                return ["Titles", character.titles?.joined(separator:", ") ?? ""]
            } else if (!(character.culture?.isEmpty ?? true)) {
                return ["Culture", character.culture ?? ""]
            } else if (!(character.gender?.isEmpty ?? true)) {
                return ["Gender", character.gender ?? ""]
            } else {
                return ["", ""]
            }
        }
    }
}

