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
        var apiService: FireAndServiceService
        
        init(title: String = "Book Details", book: GoTBookDto) {
            self.title = title
            self.model = book
            self.url = ""
            self.isLoading = false
            apiService = FireAndServiceService()
        }
        
        init(title: String = "Book Details",url: String) {
            self.title = title
            self.url = url
            self.isLoading = false
            apiService = FireAndServiceService()
            getBookDetails()
        }
        
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
                // TODO: Handle error
            }
        }
    }
}
