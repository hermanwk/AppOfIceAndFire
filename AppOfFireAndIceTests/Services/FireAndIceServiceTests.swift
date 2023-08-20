//
//  FireAndIceServiceTests.swift
//  AppOfFireAndIceTests
//
//  Created by Herman Willem Keuris on 2023/08/18.
//

import XCTest

final class FireAndIceServiceTests: XCTestCase {
    private var sut: FireAndIceService!
    
    override func setUp() {
        super.setUp()
        self.sut = FireAndIceService()
    }
    
    func testUrlRequest() {
        guard let url = URL(string: "www.test.com") else {
            super.record(XCTIssue(type: .assertionFailure, compactDescription: "Could not construct URL"))
            return
        }
        
        do {
            let actualUrl = try self.sut.urlRequest(url: url)
            let expectedMethod = "GET"
            let expectedAccept = "application/json"
            let expectedContentType = "application/json"
            let expectedPlatform = "ios"
            XCTAssertEqual(actualUrl.httpMethod, expectedMethod)
            XCTAssertEqual(actualUrl.value(forHTTPHeaderField: "Accept"), expectedAccept)
            XCTAssertEqual(actualUrl.value(forHTTPHeaderField: "Content-Type"), expectedContentType)
            XCTAssertEqual(actualUrl.value(forHTTPHeaderField: "Platform"), expectedPlatform)
        } catch {
            super.record(XCTIssue(type: .assertionFailure, compactDescription: "Failed to set URL headers"))
        }
    }
    
    func testSetCurrentPagination() {
        guard let url = URL(string: "www.test.com") else {
            super.record(XCTIssue(type: .assertionFailure, compactDescription: "Could not construct URL"))
            return
        }
        var newHeaders = [String: String]()
        
        newHeaders["Link"] = "<https://www.anapioficeandfire.com/api/characters?page=1&pageSize=10>; rel=\"first\", <https://www.anapioficeandfire.com/api/characters?page=2&pageSize=10>; rel=\"prev\", <https://www.anapioficeandfire.com/api/characters?page=4&pageSize=10>; rel=\"next\", <https://www.anapioficeandfire.com/api/characters?page=214&pageSize=10>; rel=\"last\","
        let actualUrlResponse = HTTPURLResponse(url: url, statusCode: 200, httpVersion: "1", headerFields: newHeaders)
        let actualPagination = sut.setCurrentPagination(response: actualUrlResponse)
        let expectedPaginationFirst = "https://www.anapioficeandfire.com/api/characters?page=1&pageSize=10"
        XCTAssertEqual(actualPagination.first, expectedPaginationFirst)
        let expectedPaginationPrev = "https://www.anapioficeandfire.com/api/characters?page=2&pageSize=10"
        XCTAssertEqual(actualPagination.prev, expectedPaginationPrev)
        let expectedPaginationNext = "https://www.anapioficeandfire.com/api/characters?page=4&pageSize=10"
        XCTAssertEqual(actualPagination.next, expectedPaginationNext)
        let expectedPaginationLast = "https://www.anapioficeandfire.com/api/characters?page=214&pageSize=10"
        XCTAssertEqual(actualPagination.last, expectedPaginationLast)
        let expectedPaginationCurrentPage = "3"
        XCTAssertEqual(actualPagination.currentPage, expectedPaginationCurrentPage)
    }
}
