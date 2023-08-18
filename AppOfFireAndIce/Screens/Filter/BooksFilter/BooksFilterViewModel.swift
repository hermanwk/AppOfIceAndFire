//
//  BooksFilterViewModel.swift
//  AppOfFireAndIce
//
//  Created by Herman Willem Keuris on 2023/08/16.
//

import Foundation
import SwiftUI

extension BooksFilterView {
    class ViewModel: ObservableObject {
        @Published var name: String
        var includeFromDate: Bool
        @Published var fromReleaseDate: Date
        var includeToDate: Bool
        @Published var toReleaseDate: Date
        var page: Int?
        var pageSize: Int?
        
        /// BooksFilterView.ViewModel initializer
        /// - Parameters:
        ///   - name: Filter by the name of the book(s)
        ///   - fromReleaseDate: Filter by books released after this date
        ///   - toReleaseDate: Filter by books released before this date
        ///   - page: The current page of pagination
        ///   - pageSize: The number of items per page of pagination
        init(name: String = "", fromReleaseDate: Date = Date(), toReleaseDate: Date = Date(), page: Int? = nil, pageSize: Int? = nil) {
            self.name = name
            self.includeFromDate = false
            self.fromReleaseDate = fromReleaseDate
            self.includeToDate = false
            self.toReleaseDate = toReleaseDate
            self.page = page
            self.pageSize = pageSize
        }
        
        /// Construct a `GoTBookRequest` object to be used to make a GET call to get a filtered list of books
        /// - Returns: The `GoTBookRequest` object to be used in the GET call
        func getRequest() -> GoTBookRequest {
            return GoTBookRequest(
                name: self.name == "" ? nil : self.name,
                fromReleaseDate: self.includeFromDate ? self.fromReleaseDate : nil,
                toReleaseDate: self.includeToDate ? self.toReleaseDate : nil,
                page: self.page,
                pageSize: self.pageSize
            )
        }
        
        /// Get the date of the first published work of GRR Martin. i.e. 01-01-1977
        /// - Returns: A `Date` object for the date: 01-01-1977
        func getFirstPublishingDate() -> Date {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy/MM/dd"
            return formatter.date(from: "1977/01/01") ?? Date()
        }
    }
}

