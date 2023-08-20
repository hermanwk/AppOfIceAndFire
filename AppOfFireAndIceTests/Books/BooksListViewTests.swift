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
        
        self.sut = BooksListView(vm: BooksListView.ViewModel(isMocked: true, title: "Books List Test", urls: [EnvVars.baseUrl]))
    }
    
    func testGetBooksFromModel() async {
        let testModel = GoTBookRequest()
        await self.sut.vm.getBooksFromModel(request: testModel)
        
        let actualModel: [GoTBookDto] = await self.sut.vm.model
        XCTAssertEqual(actualModel[0].url ?? "", "https://www.anapioficeandfire.com/api/books/1")
        XCTAssertEqual(actualModel[0].name ?? "", "A Game of Thrones")
        XCTAssertEqual(actualModel[0].isbn ?? "", "978-0553103540")
        XCTAssertEqual(actualModel[0].authors ?? [], ["George R. R. Martin"])
        XCTAssertEqual(actualModel[0].numberOfPages ?? 0, 694)
        XCTAssertEqual(actualModel[0].publisher ?? "", "Bantam Books")
        XCTAssertEqual(actualModel[0].country ?? "", "United States")
        XCTAssertEqual(actualModel[0].mediaType ?? "", "Hardcover")
        XCTAssertEqual(actualModel[0].released ?? "", "1996-08-01T00:00:00")
        XCTAssertEqual(actualModel[0].characters ?? [], ["https://www.anapioficeandfire.com/api/characters/2"])
        XCTAssertEqual(actualModel[0].povCharacters ?? [], ["https://www.anapioficeandfire.com/api/characters/148"])
    }
    
    func testGetBooksFromUrls() async {
        let testModel = [EnvVars.baseUrl]
        await self.sut.vm.getBooksFromUrls(urls: testModel)
        
        let actualModel: [GoTBookDto] = await self.sut.vm.model
        XCTAssertEqual(actualModel[0].url ?? "", "https://www.anapioficeandfire.com/api/books/1")
        XCTAssertEqual(actualModel[0].name ?? "", "A Game of Thrones")
        XCTAssertEqual(actualModel[0].isbn ?? "", "978-0553103540")
        XCTAssertEqual(actualModel[0].authors ?? [], ["George R. R. Martin"])
        XCTAssertEqual(actualModel[0].numberOfPages ?? 0, 694)
        XCTAssertEqual(actualModel[0].publisher ?? "", "Bantam Books")
        XCTAssertEqual(actualModel[0].country ?? "", "United States")
        XCTAssertEqual(actualModel[0].mediaType ?? "", "Hardcover")
        XCTAssertEqual(actualModel[0].released ?? "", "1996-08-01T00:00:00")
        XCTAssertEqual(actualModel[0].characters ?? [], ["https://www.anapioficeandfire.com/api/characters/2"])
        XCTAssertEqual(actualModel[0].povCharacters ?? [], ["https://www.anapioficeandfire.com/api/characters/148"])
    }
    
    func testGetBooksFromPaginationUrls() async {
        let testModel = EnvVars.baseUrl
        await self.sut.vm.getBooksFromPaginationUrls(url: testModel)
        
        let actualModel: [GoTBookDto] = await self.sut.vm.model
        XCTAssertEqual(actualModel[0].url ?? "", "https://www.anapioficeandfire.com/api/books/1")
        XCTAssertEqual(actualModel[0].name ?? "", "A Game of Thrones")
        XCTAssertEqual(actualModel[0].isbn ?? "", "978-0553103540")
        XCTAssertEqual(actualModel[0].authors ?? [], ["George R. R. Martin"])
        XCTAssertEqual(actualModel[0].numberOfPages ?? 0, 694)
        XCTAssertEqual(actualModel[0].publisher ?? "", "Bantam Books")
        XCTAssertEqual(actualModel[0].country ?? "", "United States")
        XCTAssertEqual(actualModel[0].mediaType ?? "", "Hardcover")
        XCTAssertEqual(actualModel[0].released ?? "", "1996-08-01T00:00:00")
        XCTAssertEqual(actualModel[0].characters ?? [], ["https://www.anapioficeandfire.com/api/characters/2"])
        XCTAssertEqual(actualModel[0].povCharacters ?? [], ["https://www.anapioficeandfire.com/api/characters/148"])
    }
}
