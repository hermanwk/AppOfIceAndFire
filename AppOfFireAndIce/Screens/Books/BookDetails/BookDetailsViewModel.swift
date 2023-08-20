//
//  BookDetailsViewModel.swift
//  AppOfFireAndIce
//
//  Created by Herman Willem Keuris on 2023/08/16.
//

import Foundation

extension BookDetailsView {
    class ViewModel {
        var title: String
        var model: GoTBookDto?
        var url: String
        var isLoading: Bool
        var apiService: FireAndIceService
        
        /// BookDetailsView.ViewModel initializer when a `GoTBookDto` object is passed
        /// - Parameters:
        ///   - title: The title to be displayed in the Navigation Bar
        ///   - book: The data model which contains the details of the currently displayed book
        init(isMocked: Bool = false, title: String = "Book Details", book: GoTBookDto) {
            self.title = title
            self.model = book
            self.url = ""
            self.isLoading = false
            apiService = FireAndIceService(isMocked: isMocked)
        }
        
        /// BookDetailsView.ViewModel initializer when a url pointing to the specific book is passed
        /// - Parameters:
        ///   - title: The title to be displayed in the Navigation Bar
        ///   - url: A url that can be used to get detailed information of a specific book
        init(isMocked: Bool = false, title: String = "Book Details",url: String) {
            self.title = title
            self.url = url
            self.isLoading = false
            apiService = FireAndIceService(isMocked: isMocked)
            getBookDetails()
        }
        
        /// Makes a GET call to get detailed information of a specific book
        func getBookDetails() {
            let dispatchGroup = DispatchGroup()
            
            dispatchGroup.enter()
            self.isLoading = true
            do {
                let request = try apiService.urlRequest(url: URL(string: url)!)
                apiService.call(urlRequest: request) { (book: GoTBookDto, _: PaginationModel) in
                    DispatchQueue.main.async{
                        self.model = book
                        self.isLoading = false
                        dispatchGroup.leave()
                    }
                }
            } catch {
                self.isLoading = false
                dispatchGroup.leave()
            }
        }
    }
}
