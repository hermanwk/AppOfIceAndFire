//
//  CharactersListViewModel.swift
//  AppOfFireAndIce
//
//  Created by Herman Willem Keuris on 2023/08/16.
//

import SwiftUI

extension CharactersListView {
    class ViewModel: ObservableObject {
        var title: String
        var isLoading: Bool
        var pagination: PaginationModel
        var apiService: FireAndServiceService
        @Published var model: [GoTCharacterDto]
        var cancelSearch: () -> Void
        
        /// CharactersListView.ViewModel initializer
        /// - Parameters:
        ///   - title: The title to be displayed in the Navigation Bar
        ///   - urls: A list of urls to be called to get a list of characters
        ///   - request: A request object which can be used to get a filtered list of characters
        ///   - cancelSearch: A method to be called when cancelling the search filtering of characters
        init(title: String = "Characters", urls: [String]? = nil, request: GoTCharacterRequest? = nil, cancelSearch: @escaping () -> () = {}) {
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
        
        /// Get a filtered list of characters from a request object
        /// - Parameter request: A `GoTCharacterRequest` object which is  used to filter for specific characters
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
            }
        }
        
        /// Get a  list of characters from a list of urls
        /// - Parameter urls: A list of urls to be called to construct a list of characters
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
                    isLoading = false
                }
            })
            
            dispatchGroup.notify(queue: .main) {
                self.isLoading = false
            }
        }
        
        /// Get a  list of characters from a list of urls provided by a `PaginationModel`
        /// - Parameter url: A url provided by a `PaginationModel` used to get a list of characters
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
            }
        }
        
        /// Used to account for missing data in returned `GoTCharacterDto` objects. A field is selected as a secondary identifier for the character and is given a relevant label for that field
        /// - Parameter character: A `GoTCharacterDto` object used to select a secondary identifier field for the character
        /// - Returns: An array of two strings. The first is the label to be used for the identifier field and the second is the value of the identifier field
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

