//
//  PaginationModel.swift
//  AppOfFireAndIce
//
//  Created by Herman Willem Keuris on 2023/08/10.
//

import Foundation

struct PaginationModel {
    var prev: String
    var next: String
    var first: String
    var last: String
    var currentPage: String
    
    init(prev: String = "", next: String = "", first: String = "", last: String = "", currentPage: String = "") {
        self.prev = prev
        self.next = next
        self.first = first
        self.last = last
        self.currentPage = currentPage
    }
}
