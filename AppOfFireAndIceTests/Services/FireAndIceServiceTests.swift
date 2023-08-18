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
}
