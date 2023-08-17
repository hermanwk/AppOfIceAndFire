//
//  BooksListViewModel.swift
//  AppOfFireAndIce
//
//  Created by Herman Willem Keuris on 2023/08/16.
//

import Foundation
import SwiftUI

extension BooksListView {
    class ViewModel: ObservableObject {
        var theme: AppTheme
        var title: String
        var isLoading: Bool
        var pagination: PaginationModel
        var apiService: FireAndServiceService
        var cancelSearch: () -> Void
        @Published var model: [GoTBookDto]
        
        init(title: String = "Books", urls: [String]? = nil, request: GoTBookRequest? = nil, cancelSearch: @escaping () -> () = {}) {
            theme = AppTheme.preview
            self.title = title
            isLoading = false
            pagination = PaginationModel()
            apiService = FireAndServiceService()
            model = []
            self.cancelSearch = cancelSearch
            
            if (urls != nil && urls?.count ?? 0 > 0) {
                getBooksFromUrls(urls: urls)
            } else if (request != nil) {
                getBooksFromModel(request: request!)
            } else {
                getBooksFromModel(request: GoTBookRequest())
            }
        }
        
        func getBooksFromModel(request: GoTBookRequest) {
            isLoading = true
            
            var components = URLComponents(string: "\(EnvVars.baseUrl)\(FireAndServiceService.API.getBooks.path)")!
            components.queryItems = [
                URLQueryItem(name: "name", value: request.name),
                URLQueryItem(name: "fromReleaseDate", value: request.fromReleaseDate?.description),
                URLQueryItem(name: "toReleaseDate", value: request.toReleaseDate?.description),
                URLQueryItem(name: "page", value: request.page?.description),
                URLQueryItem(name: "pageSize", value: request.pageSize?.description)
            ]
            do {
                let request = try apiService.urlRequest(url: components.url!)
                apiService.call(urlRequest: request) { (books: [GoTBookDto], pagination: PaginationModel) in
                    DispatchQueue.main.async{
                        self.model = books
                        self.pagination = pagination
                        self.isLoading = false
                    }
                }
            } catch {
                // TODO
                self.isLoading = false
            }
        }
        
        func getBooksFromUrls(urls: [String]?) {
            isLoading = true
            let dispatchGroup = DispatchGroup()

            urls?.forEach({ url in
                dispatchGroup.enter()
                do {
                    let request = try apiService.urlRequest(url: URL(string: url)!)
                    apiService.call(urlRequest: request) { (book: GoTBookDto, pagination: PaginationModel) in
                        DispatchQueue.main.async{
                            self.model.append(book)
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
        
        func getBooksFromPaginationUrls(url: String){
            do {
                self.isLoading = true
                let request = try apiService.urlRequest(url: URL(string: url)!)
                apiService.call(urlRequest: request) { (books: [GoTBookDto], pagination: PaginationModel) in
                    DispatchQueue.main.async{
                        self.model = books
                        self.pagination = pagination
                        self.isLoading = false
                    }
                }
            } catch {
                // TODO: Handle error
                self.isLoading = false
            }
        }
        
        func getPrimaryTitleText(character: GoTCharacterDto) -> [String] {
            if (!(character.name?.isEmpty ?? true)) {
                return ["Name", character.name ?? ""]
            } else {
                return ["Aliases", character.aliases?.joined(separator:", ") ?? ""]
            }
        }
    }
}

