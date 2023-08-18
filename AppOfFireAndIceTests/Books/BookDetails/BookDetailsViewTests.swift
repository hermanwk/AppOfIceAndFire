//
//  BookDetailsViewTests.swift
//  AppOfFireAndIceTests
//
//  Created by Herman Willem Keuris on 2023/08/18.
//

import XCTest

final class BookDetailsViewTests: XCTestCase {
    private var sut: BookDetailsView!
    
    override func setUp() {
        super.setUp()
        
        self.sut = BookDetailsView(vm: BookDetailsView.ViewModel(title: "Book Details Test", book: GoTBookDto()))
    }
}
