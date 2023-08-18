//
//  MainFilterViewTests.swift
//  AppOfFireAndIceTests
//
//  Created by Herman Willem Keuris on 2023/08/18.
//

import XCTest

final class MainFilterViewTests: XCTestCase {
    private var sut: MainFilterView!
    
    override func setUp() {
        super.setUp()
        
        self.sut = MainFilterView(vm: MainFilterView.ViewModel())
    }

    func testGetSearchType() {
        self.sut.vm.selectedTab = PageEnum.books
        let actualBooks = self.sut.vm.getSearchType()
        let expectedBooks = "Books"
        XCTAssertEqual(actualBooks, expectedBooks)
        
        self.sut.vm.selectedTab = PageEnum.characters
        let actualCharacters = self.sut.vm.getSearchType()
        let expectedCharacters = "Characters"
        XCTAssertEqual(actualCharacters, expectedCharacters)
            
        self.sut.vm.selectedTab = PageEnum.houses
        let actualHouses = self.sut.vm.getSearchType()
        let expectedHouses = "Houses"
        XCTAssertEqual(actualHouses, expectedHouses)
    }
}
