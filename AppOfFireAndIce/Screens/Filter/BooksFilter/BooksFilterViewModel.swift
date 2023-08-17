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
        @Published var fromReleaseDate: Date
        @Published var toReleaseDate: Date
        var page: Int?
        var pageSize: Int?
        
        init(name: String = "", fromReleaseDate: Date = Date(), toReleaseDate: Date = Date(), page: Int? = nil, pageSize: Int? = nil) {
            self.name = name
            self.fromReleaseDate = fromReleaseDate
            self.toReleaseDate = toReleaseDate
            self.page = page
            self.pageSize = pageSize
        }
        
        func getRequest() -> GoTBookRequest {
            return GoTBookRequest(
                name: self.name == "" ? nil : self.name,
                fromReleaseDate: self.fromReleaseDate,
                toReleaseDate: self.toReleaseDate,
                page: self.page,
                pageSize: self.pageSize
            )
        }
        
        // Get the date of the first publishing of GRR Martin's work. i.e. 01-01-1977
        func getFirstPublishingDate() -> Date {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy/MM/dd"
            return formatter.date(from: "1977/01/01") ?? Date()
        }
    }
}

