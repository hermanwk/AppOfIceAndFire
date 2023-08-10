//
//  PageState.swift
//  AppOfFireAndIce
//
//  Created by Herman Willem Keuris on 2023/08/09.
//

import Foundation

class PageModel {
    var title: String?
    var type: PageEnum
    var isLoading: Bool
    var urls: [String]
    
    init(title: String? = nil, type: PageEnum = PageEnum.home, isLoading: Bool = false, urls: [String] = []) {
        self.title = title
        self.type = type
        self.isLoading = isLoading
        self.urls = urls
    }
}
