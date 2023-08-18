//
//  CharactersListViewTests.swift
//  AppOfFireAndIceTests
//
//  Created by Herman Willem Keuris on 2023/08/18.
//

import XCTest

final class CharactersListViewTests: XCTestCase {
    private var sut: CharactersListView!
    
    override func setUp() {
        super.setUp()
        self.sut = CharactersListView(vm: CharactersListView.ViewModel(title: "Characters Tests"))
    }
}
