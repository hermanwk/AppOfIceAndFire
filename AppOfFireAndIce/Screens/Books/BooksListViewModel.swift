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
        var title: String
        var isLoading: Bool
        var pagination: PaginationModel
        var apiService: FireAndIceService
        @Published var model: [GoTBookDto]
        var cancelSearch: () -> Void
        
        /// BooksListView.ViewModel initializer
        /// - Parameters:
        ///   - title: The title to be displayed in the Navigation Bar
        ///   - urls: A list of urls to be called to get a list of books
        ///   - request: A request object which can be used to get a filtered list of books
        ///   - cancelSearch: A method to be called when cancelling the search filtering of books
        init(title: String = "Books", urls: [String]? = nil, request: GoTBookRequest? = nil, cancelSearch: @escaping () -> () = {}) {
            self.title = title
            isLoading = false
            pagination = PaginationModel()
            apiService = FireAndIceService()
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
        
        /// Get a filtered list of books from a request object
        /// - Parameter request: A `GoTBookRequest` object which is  used to filter for specific books
        func getBooksFromModel(request: GoTBookRequest) {
            isLoading = true
            
            var components = URLComponents(string: "\(EnvVars.baseUrl)\(FireAndIceService.API.getBooks.path)")!
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
                self.isLoading = false
            }
        }
        
        /// Get a  list of books from a list of urls
        /// - Parameter urls: A list of urls to be called to construct a list of books
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
                    isLoading = false
                }
            })
            
            dispatchGroup.notify(queue: .main) {
                self.isLoading = false
            }
        }
        
        /// Get a  list of books from a list of urls provided by a `PaginationModel`
        /// - Parameter url: A url provided by a `PaginationModel` used to get a list of books
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
                self.isLoading = false
            }
        }
    }
}

