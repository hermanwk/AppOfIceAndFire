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
        
        self.sut = BookDetailsView(vm: BookDetailsView.ViewModel(isMocked: true, title: "Book Details Test", url: EnvVars.baseUrl))
    }
    
    func testGetBookDetails() async {
        self.sut.vm.getBookDetails()
        do {
            while (self.sut.vm.model == nil) {
                try await Task.sleep(nanoseconds: 500)
            }
        } catch {
            super.record(XCTIssue(type: .assertionFailure, compactDescription: "Failed to set timer"))
        }
        
        let actualModel: GoTBookDto? = self.sut.vm.model
        XCTAssertEqual(actualModel?.url ?? "", "https://www.anapioficeandfire.com/api/books/1")
        XCTAssertEqual(actualModel?.name ?? "", "A Game of Thrones")
        XCTAssertEqual(actualModel?.isbn ?? "", "978-0553103540")
        XCTAssertEqual(actualModel?.authors ?? [], ["George R. R. Martin"])
        XCTAssertEqual(actualModel?.numberOfPages ?? 0, 694)
        XCTAssertEqual(actualModel?.publisher ?? "", "Bantam Books")
        XCTAssertEqual(actualModel?.country ?? "", "United States")
        XCTAssertEqual(actualModel?.mediaType ?? "", "Hardcover")
        XCTAssertEqual(actualModel?.released ?? "", "1996-08-01T00:00:00")
        XCTAssertEqual(actualModel?.characters ?? [], ["https://www.anapioficeandfire.com/api/characters/2"])
        XCTAssertEqual(actualModel?.povCharacters ?? [], ["https://www.anapioficeandfire.com/api/characters/148"])
    }
}
