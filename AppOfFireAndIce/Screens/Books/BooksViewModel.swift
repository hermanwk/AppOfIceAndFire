//
//  BooksViewModel.swift
//  AppOfFireAndIce
//
//  Created by Herman Willem Keuris on 2023/08/09.
//

import Foundation
import SwiftUI

extension BooksView {
    class ViewModel: ObservableObject {
        // State
        var theme: AppTheme
        var isLoading: Bool
        var pagination: PaginationModel
        var apiService: FireAndServiceService
        
        // Data bindings
        @Published var model: [GoTBookDto]
        @Binding var navigationStack: Stack<PageModel>
        
        init(urls: [String]? = nil, navigationStack: Binding<Stack<PageModel>>) {
            theme = AppTheme.preview
            isLoading = false
            pagination = PaginationModel()
            apiService = FireAndServiceService()
            model = []
            self._navigationStack = navigationStack
            
            if (urls != nil && urls?.count ?? 0 > 0) {
                getBookUrls(urls: urls)
            } else {
                getBooks(request: GoTBookRequest())
            }
        }
        
        func getBooks(request: GoTBookRequest) {
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
            }
        }
        
        func getBookUrls(urls: [String]?) {
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
        
        func navigatePagination(url: String){
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
            }
        }
    }
}
