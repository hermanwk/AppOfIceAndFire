//
//  HousesFilterViewTests.swift
//  AppOfFireAndIceTests
//
//  Created by Herman Willem Keuris on 2023/08/18.
//

import XCTest

final class HousesFilterViewTests: XCTestCase {
    private var sut: HousesFilterView!
    
    override func setUp() {
        super.setUp()
        
        self.sut = HousesFilterView(vm: HousesFilterView.ViewModel())
    }

    func testGetRequestName() {
        let actualEmpty = sut.vm.getRequest()
        let expectedEmpty = GoTHouseRequest()
        XCTAssertEqual(actualEmpty.name, expectedEmpty.name)
        
        sut.vm.name = "Test name"
        let actualName = sut.vm.getRequest()
        let expectedName = GoTHouseRequest(name: "Test name")
        XCTAssertEqual(actualName.name, expectedName.name)
    }
    
    func testGetRequestRegion() {
        let actualEmpty = sut.vm.getRequest()
        let expectedEmpty = GoTHouseRequest()
        XCTAssertEqual(actualEmpty.region, expectedEmpty.region)
        
        sut.vm.region = "Test region"
        let actualRegion = sut.vm.getRequest()
        let expectedRegion = GoTHouseRequest(region: "Test region")
        XCTAssertEqual(actualRegion.region, expectedRegion.region)
    }
    
    func testGetRequestWords() {
        let actualEmpty = sut.vm.getRequest()
        let expectedEmpty = GoTHouseRequest()
        XCTAssertEqual(actualEmpty.region, expectedEmpty.region)
        
        sut.vm.words = "Test words"
        let actualWords = sut.vm.getRequest()
        let expectedWords = GoTHouseRequest(words: "Test words")
        XCTAssertEqual(actualWords.words, expectedWords.words)
    }
    
    func testGetRequestHasWords() {
        sut.vm.hasWords = 1
        let actualTrue = sut.vm.getRequest()
        let expectedHasTrue = GoTHouseRequest(hasWords: true)
        XCTAssertEqual(actualTrue.hasWords, expectedHasTrue.hasWords)
        
        sut.vm.hasWords = 2
        let actualFalse = sut.vm.getRequest()
        let expectedFalse = GoTHouseRequest(hasWords: false)
        XCTAssertEqual(actualFalse.hasWords, expectedFalse.hasWords)
        
        sut.vm.hasWords = 0
        let actualZero = sut.vm.getRequest()
        let expectedZero = GoTHouseRequest()
        XCTAssertEqual(actualZero.hasWords, expectedZero.hasWords)
    }
    
    func testGetRequestHasTitles() {
        sut.vm.hasTitles = 1
        let actualTrue = sut.vm.getRequest()
        let expectedHasTrue = GoTHouseRequest(hasTitles: true)
        XCTAssertEqual(actualTrue.hasTitles, expectedHasTrue.hasTitles)
        
        sut.vm.hasTitles = 2
        let actualFalse = sut.vm.getRequest()
        let expectedFalse = GoTHouseRequest(hasTitles: false)
        XCTAssertEqual(actualFalse.hasTitles, expectedFalse.hasTitles)
        
        sut.vm.hasTitles = 0
        let actualZero = sut.vm.getRequest()
        let expectedZero = GoTHouseRequest()
        XCTAssertEqual(actualZero.hasTitles, expectedZero.hasTitles)
    }
    
    func testGetRequestHasSeats() {
        sut.vm.hasSeats = 1
        let actualTrue = sut.vm.getRequest()
        let expectedHasTrue = GoTHouseRequest(hasSeats: true)
        XCTAssertEqual(actualTrue.hasSeats, expectedHasTrue.hasSeats)
        
        sut.vm.hasSeats = 2
        let actualFalse = sut.vm.getRequest()
        let expectedFalse = GoTHouseRequest(hasSeats: false)
        XCTAssertEqual(actualFalse.hasSeats, expectedFalse.hasSeats)
        
        sut.vm.hasSeats = 0
        let actualZero = sut.vm.getRequest()
        let expectedZero = GoTHouseRequest()
        XCTAssertEqual(actualZero.hasSeats, expectedZero.hasSeats)
    }
    
    func testGetRequestDiedOut() {
        sut.vm.hasDiedOut = 1
        let actualTrue = sut.vm.getRequest()
        let expectedHasTrue = GoTHouseRequest(hasDiedOut: true)
        XCTAssertEqual(actualTrue.hasDiedOut, expectedHasTrue.hasDiedOut)
        
        sut.vm.hasDiedOut = 2
        let actualFalse = sut.vm.getRequest()
        let expectedFalse = GoTHouseRequest(hasDiedOut: false)
        XCTAssertEqual(actualFalse.hasDiedOut, expectedFalse.hasDiedOut)
        
        sut.vm.hasDiedOut = 0
        let actualZero = sut.vm.getRequest()
        let expectedZero = GoTHouseRequest()
        XCTAssertEqual(actualZero.hasDiedOut, expectedZero.hasDiedOut)
    }
    
    func testGetRequestHasAncestralWeapons() {
        sut.vm.hasAncestralWeapons = 1
        let actualTrue = sut.vm.getRequest()
        let expectedHasTrue = GoTHouseRequest(hasAncestralWeapons: true)
        XCTAssertEqual(actualTrue.hasAncestralWeapons, expectedHasTrue.hasAncestralWeapons)
        
        sut.vm.hasAncestralWeapons = 2
        let actualFalse = sut.vm.getRequest()
        let expectedFalse = GoTHouseRequest(hasAncestralWeapons: false)
        XCTAssertEqual(actualFalse.hasAncestralWeapons, expectedFalse.hasAncestralWeapons)
        
        sut.vm.hasAncestralWeapons = 0
        let actualZero = sut.vm.getRequest()
        let expectedZero = GoTHouseRequest()
        XCTAssertEqual(actualZero.hasAncestralWeapons, expectedZero.hasAncestralWeapons)
    }
    
    func testGetRequestPage() {
        let actualEmpty = sut.vm.getRequest()
        let expectedEmpty = GoTCharacterRequest()
        XCTAssertEqual(actualEmpty.page, expectedEmpty.page)
        
        sut.vm.page = 1
        let actualPage = sut.vm.getRequest()
        let expectedPage = GoTCharacterRequest(page: 1)
        XCTAssertEqual(actualPage.page, expectedPage.page)
    }
    
    func testGetRequestPageSize() {
        let actualEmpty = sut.vm.getRequest()
        let expectedEmpty = GoTCharacterRequest()
        XCTAssertEqual(actualEmpty.pageSize, expectedEmpty.pageSize)
        
        sut.vm.page = 1
        let actualPage = sut.vm.getRequest()
        let expectedPage = GoTCharacterRequest(page: 1)
        XCTAssertEqual(actualPage.page, expectedPage.page)
    }
}
