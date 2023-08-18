//
//  MainViewTests.swift
//  AppOfFireAndIceTests
//
//  Created by Herman Willem Keuris on 2023/08/18.
//

import XCTest

final class MainViewTests: XCTestCase {
    private var sut: MainView!
    
    override func setUp() {
        super.setUp()
        
        self.sut = MainView(vm: MainView.ViewModel())
    }
    
    func testBookSearch() {
        sut.vm.selectedTab = PageEnum.books
        sut.vm.searchText = "Test book"
        sut.vm.search()
        
        let actualSearchText = sut.vm.searchText
        let expectedSearchText = "Test book"
        XCTAssertEqual(actualSearchText, expectedSearchText)
        
        let actualRequest = sut.vm.booksRequest
        let expectedRequest = GoTBookRequest(name: "Test book")
        XCTAssertEqual(actualRequest, expectedRequest)
        
        sut.vm.cancelSearch()
        
        let actualCanceledSearchText = sut.vm.searchText
        let expectedCanceledSearchText = ""
        XCTAssertEqual(actualCanceledSearchText, expectedCanceledSearchText)
        
        let actualCanceledRequest = sut.vm.booksRequest
        let expectedCanceledRequest = GoTBookRequest(name: "")
        XCTAssertEqual(actualCanceledRequest, expectedCanceledRequest)
    }
    
    func testCharacterSearch() {
        sut.vm.selectedTab = PageEnum.characters
        sut.vm.searchText = "Test character"
        sut.vm.search()
        
        let actualSearchText = sut.vm.searchText
        let expectedSearchText = "Test character"
        XCTAssertEqual(actualSearchText, expectedSearchText)
        
        let actualRequest = sut.vm.charactersRequest
        let expectedRequest = GoTCharacterRequest(name: "Test character")
        XCTAssertEqual(actualRequest, expectedRequest)
        
        sut.vm.cancelSearch()
        
        let actualCanceledSearchText = sut.vm.searchText
        let expectedCanceledSearchText = ""
        XCTAssertEqual(actualCanceledSearchText, expectedCanceledSearchText)
        
        let actualCanceledRequest = sut.vm.charactersRequest
        let expectedCanceledRequest = GoTCharacterRequest(name: "")
        XCTAssertEqual(actualCanceledRequest, expectedCanceledRequest)
    }
    
    func testHouseSearch() {
        sut.vm.selectedTab = PageEnum.houses
        sut.vm.searchText = "Test house"
        sut.vm.search()
        
        let actualSearchText = sut.vm.searchText
        let expectedSearchText = "Test house"
        XCTAssertEqual(actualSearchText, expectedSearchText)
        
        let actualRequest = sut.vm.housesRequest
        let expectedRequest = GoTHouseRequest(name: "Test house")
        XCTAssertEqual(actualRequest, expectedRequest)
        
        sut.vm.cancelSearch()
        
        let actualCanceledSearchText = sut.vm.searchText
        let expectedCanceledSearchText = ""
        XCTAssertEqual(actualCanceledSearchText, expectedCanceledSearchText)
        
        let actualCanceledRequest = sut.vm.housesRequest
        let expectedCanceledRequest = GoTHouseRequest(name: "")
        XCTAssertEqual(actualCanceledRequest, expectedCanceledRequest)
    }
}
