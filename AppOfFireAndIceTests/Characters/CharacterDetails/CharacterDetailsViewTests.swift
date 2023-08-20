//
//  CharacterDetailsViewTests.swift
//  AppOfFireAndIceTests
//
//  Created by Herman Willem Keuris on 2023/08/18.
//

import XCTest

final class CharacterDetailsViewTests: XCTestCase {
    private var sut: CharacterDetailsView!
    
    override func setUp() {
        super.setUp()
        
        self.sut = CharacterDetailsView(vm: CharacterDetailsView.ViewModel(isMocked: true, title: "Character Details Test", url: EnvVars.baseUrl))
    }
    
    func testGetBookDetails() async {
        self.sut.vm.getCharacterDetails()
        do {
            while (self.sut.vm.model == nil) {
                try await Task.sleep(nanoseconds: 500)
            }
        } catch {
            super.record(XCTIssue(type: .assertionFailure, compactDescription: "Failed to set timer"))
        }
        
        let actualModel: GoTCharacterDto? = self.sut.vm.model
        XCTAssertEqual(actualModel?.url ?? "", "https://www.anapioficeandfire.com/api/characters/823")
        XCTAssertEqual(actualModel?.name ?? "", "Petyr Baelish")
        XCTAssertEqual(actualModel?.culture ?? "", "Valemen")
        XCTAssertEqual(actualModel?.born ?? "", "In 268 AC, at the Fingers")
        XCTAssertEqual(actualModel?.died ?? "", "")
        XCTAssertEqual(actualModel?.titles ?? [] , ["Master of coin (formerly)", "Lord Paramount of the Trident", "Lord of Harrenhal", "Lord Protector of the Vale"])
        XCTAssertEqual(actualModel?.aliases ?? [], ["Littlefinger"])
        XCTAssertEqual(actualModel?.father ?? "", "")
        XCTAssertEqual(actualModel?.mother ?? "", "")
        XCTAssertEqual(actualModel?.spouse ?? "", "https://www.anapioficeandfire.com/api/characters/688")
        XCTAssertEqual(actualModel?.allegiances ?? [], ["https://www.anapioficeandfire.com/api/houses/10", "https://www.anapioficeandfire.com/api/houses/11"])
        XCTAssertEqual(actualModel?.books ?? [], ["https://www.anapioficeandfire.com/api/books/1"])
        XCTAssertEqual(actualModel?.povBooks ?? [], [])
        XCTAssertEqual(actualModel?.tvSeries ?? [], ["Season 1", "Season 2", "Season 3", "Season 4", "Season 5"])
        XCTAssertEqual(actualModel?.playedBy ?? [], ["Aidan Gillen"])
    }
}
