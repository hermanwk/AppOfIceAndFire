//
//  GoTBook.swift
//  AppOfFireAndIce
//
//  Created by Herman Willem Keuris on 2023/08/09.
//

import Foundation

class GoTBookModel: IGoTObject {
    var isLoaded: Bool
    var url: String?
    var data: GoTBookDto?
    
    public required init(data: GoTBookDto) {
        self.isLoaded = true
        self.url = data.url
        self.data = data
    }
    
    public required init(url: String) {
        self.isLoaded = false
        self.url = url
        self.data = nil
    }
}
