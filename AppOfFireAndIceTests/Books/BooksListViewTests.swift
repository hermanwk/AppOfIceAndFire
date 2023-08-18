//
//  BooksListViewTests.swift
//  AppOfFireAndIceTests
//
//  Created by Herman Willem Keuris on 2023/08/18.
//

import XCTest

final class BooksListViewTests: XCTestCase {
    private var sut: BooksListView!
    
    override func setUp() {
        super.setUp()
        self.sut = BooksListView(vm: BooksListView.ViewModel(title: "Books Tests"))
    }
}
