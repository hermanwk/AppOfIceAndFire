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
        
        self.sut = CharactersListView(vm: CharactersListView.ViewModel(isMocked: true, title: "Characters List Test", urls: [EnvVars.baseUrl]))
    }
    
    func testGetCharacterFromModel() async {
        let testModel = GoTCharacterRequest()
        await self.sut.vm.getCharactersFromModel(request: testModel)
        
        let actualModel: [GoTCharacterDto] = await self.sut.vm.model
        XCTAssertEqual(actualModel[0].url ?? "", "https://www.anapioficeandfire.com/api/characters/823")
        XCTAssertEqual(actualModel[0].name ?? "", "Petyr Baelish")
        XCTAssertEqual(actualModel[0].culture ?? "", "Valemen")
        XCTAssertEqual(actualModel[0].born ?? "", "In 268 AC, at the Fingers")
        XCTAssertEqual(actualModel[0].died ?? "", "")
        XCTAssertEqual(actualModel[0].titles ?? [] , ["Master of coin (formerly)", "Lord Paramount of the Trident", "Lord of Harrenhal", "Lord Protector of the Vale"])
        XCTAssertEqual(actualModel[0].aliases ?? [], ["Littlefinger"])
        XCTAssertEqual(actualModel[0].father ?? "", "")
        XCTAssertEqual(actualModel[0].mother ?? "", "")
        XCTAssertEqual(actualModel[0].spouse ?? "", "https://www.anapioficeandfire.com/api/characters/688")
        XCTAssertEqual(actualModel[0].allegiances ?? [], ["https://www.anapioficeandfire.com/api/houses/10", "https://www.anapioficeandfire.com/api/houses/11"])
        XCTAssertEqual(actualModel[0].books ?? [], ["https://www.anapioficeandfire.com/api/books/1"])
        XCTAssertEqual(actualModel[0].povBooks ?? [], [])
        XCTAssertEqual(actualModel[0].tvSeries ?? [], ["Season 1", "Season 2", "Season 3", "Season 4", "Season 5"])
        XCTAssertEqual(actualModel[0].playedBy ?? [], ["Aidan Gillen"])
    }
    
    func testGetCharactersFromUrls() async {
        let testModel = [EnvVars.baseUrl]
        await self.sut.vm.getCharactersFromUrls(urls: testModel)
        
        let actualModel: [GoTCharacterDto] = await self.sut.vm.model
        XCTAssertEqual(actualModel[0].url ?? "", "https://www.anapioficeandfire.com/api/characters/823")
        XCTAssertEqual(actualModel[0].name ?? "", "Petyr Baelish")
        XCTAssertEqual(actualModel[0].culture ?? "", "Valemen")
        XCTAssertEqual(actualModel[0].born ?? "", "In 268 AC, at the Fingers")
        XCTAssertEqual(actualModel[0].died ?? "", "")
        XCTAssertEqual(actualModel[0].titles ?? [] , ["Master of coin (formerly)", "Lord Paramount of the Trident", "Lord of Harrenhal", "Lord Protector of the Vale"])
        XCTAssertEqual(actualModel[0].aliases ?? [], ["Littlefinger"])
        XCTAssertEqual(actualModel[0].father ?? "", "")
        XCTAssertEqual(actualModel[0].mother ?? "", "")
        XCTAssertEqual(actualModel[0].spouse ?? "", "https://www.anapioficeandfire.com/api/characters/688")
        XCTAssertEqual(actualModel[0].allegiances ?? [], ["https://www.anapioficeandfire.com/api/houses/10", "https://www.anapioficeandfire.com/api/houses/11"])
        XCTAssertEqual(actualModel[0].books ?? [], ["https://www.anapioficeandfire.com/api/books/1"])
        XCTAssertEqual(actualModel[0].povBooks ?? [], [])
        XCTAssertEqual(actualModel[0].tvSeries ?? [], ["Season 1", "Season 2", "Season 3", "Season 4", "Season 5"])
        XCTAssertEqual(actualModel[0].playedBy ?? [], ["Aidan Gillen"])
    }
    
    func testGetCharactersFromPaginationUrls() async {
        let testModel = EnvVars.baseUrl
        await self.sut.vm.getCharactersFromPaginationUrls(url: testModel)
        
        let actualModel: [GoTCharacterDto] = await self.sut.vm.model
        XCTAssertEqual(actualModel[0].url ?? "", "https://www.anapioficeandfire.com/api/characters/823")
        XCTAssertEqual(actualModel[0].name ?? "", "Petyr Baelish")
        XCTAssertEqual(actualModel[0].culture ?? "", "Valemen")
        XCTAssertEqual(actualModel[0].born ?? "", "In 268 AC, at the Fingers")
        XCTAssertEqual(actualModel[0].died ?? "", "")
        XCTAssertEqual(actualModel[0].titles ?? [] , ["Master of coin (formerly)", "Lord Paramount of the Trident", "Lord of Harrenhal", "Lord Protector of the Vale"])
        XCTAssertEqual(actualModel[0].aliases ?? [], ["Littlefinger"])
        XCTAssertEqual(actualModel[0].father ?? "", "")
        XCTAssertEqual(actualModel[0].mother ?? "", "")
        XCTAssertEqual(actualModel[0].spouse ?? "", "https://www.anapioficeandfire.com/api/characters/688")
        XCTAssertEqual(actualModel[0].allegiances ?? [], ["https://www.anapioficeandfire.com/api/houses/10", "https://www.anapioficeandfire.com/api/houses/11"])
        XCTAssertEqual(actualModel[0].books ?? [], ["https://www.anapioficeandfire.com/api/books/1"])
        XCTAssertEqual(actualModel[0].povBooks ?? [], [])
        XCTAssertEqual(actualModel[0].tvSeries ?? [], ["Season 1", "Season 2", "Season 3", "Season 4", "Season 5"])
        XCTAssertEqual(actualModel[0].playedBy ?? [], ["Aidan Gillen"])
    }
}
