//
//  BooksFilterViewTests.swift
//  AppOfFireAndIceTests
//
//  Created by Herman Willem Keuris on 2023/08/18.
//

import XCTest

final class BooksFilterViewTests: XCTestCase {
    private var sut: BooksFilterView!
    
    override func setUp() {
        super.setUp()
        
        self.sut = BooksFilterView(vm: BooksFilterView.ViewModel())
    }
    
    func testGetRequestName() {
        let actualEmpty = sut.vm.getRequest()
        let expectedEmpty = GoTBookRequest()
        XCTAssertEqual(actualEmpty.name, expectedEmpty.name)
        
        sut.vm.name = "Test name"
        let actualName = sut.vm.getRequest()
        let expectedName = GoTBookRequest(name: "Test name")
        XCTAssertEqual(actualName.name, expectedName.name)
    }
    
    func testGetToRequestReleaseDate() {
        let actualEmpty = sut.vm.getRequest()
        let expectedEmpty = GoTBookRequest()
        XCTAssertEqual(actualEmpty.toReleaseDate, expectedEmpty.toReleaseDate)
        
        sut.vm.includeToDate = true
        sut.vm.toReleaseDate = Date()
        let actualReleaseDate = sut.vm.getRequest()
        let expectedReleaseDate = GoTBookRequest(toReleaseDate: Date())
        XCTAssertEqual(actualReleaseDate.toReleaseDate?.timeIntervalSince1970 ?? 0, expectedReleaseDate.toReleaseDate?.timeIntervalSince1970 ?? 0, accuracy: 0.01)
    }
    
    func testGetRequestFromReleaseDate() {
        let actualEmpty = sut.vm.getRequest()
        let expectedEmpty = GoTBookRequest()
        XCTAssertEqual(actualEmpty.fromReleaseDate, expectedEmpty.fromReleaseDate)
        
        sut.vm.includeFromDate = true
        sut.vm.fromReleaseDate = Date()
        let actualReleaseDate = sut.vm.getRequest()
        let expectedReleaseDate = GoTBookRequest(fromReleaseDate: Date())
        XCTAssertEqual(actualReleaseDate.fromReleaseDate?.timeIntervalSince1970 ?? 0, expectedReleaseDate.fromReleaseDate?.timeIntervalSince1970 ?? 0, accuracy: 0.01)
    }
    
    func testGetRequestPage() {
        let actualEmpty = sut.vm.getRequest()
        let expectedEmpty = GoTBookRequest()
        XCTAssertEqual(actualEmpty.page, expectedEmpty.page)
        
        sut.vm.page = 1
        let actualPage = sut.vm.getRequest()
        let expectedPage = GoTBookRequest(page: 1)
        XCTAssertEqual(actualPage.page, expectedPage.page)
    }
    
    func testGetRequestPageSize() {
        let actualEmpty = sut.vm.getRequest()
        let expectedEmpty = GoTBookRequest()
        XCTAssertEqual(actualEmpty.pageSize, expectedEmpty.pageSize)
        
        sut.vm.page = 1
        let actualPage = sut.vm.getRequest()
        let expectedPage = GoTBookRequest(page: 1)
        XCTAssertEqual(actualPage.page, expectedPage.page)
    }
}
