//
//  HousesListViewTests.swift
//  AppOfFireAndIceTests
//
//  Created by Herman Willem Keuris on 2023/08/18.
//

import XCTest

final class HousesListViewTests: XCTestCase {
    private var sut: HousesListView!
    
    override func setUp() {
        super.setUp()
        
        self.sut = HousesListView(vm: HousesListView.ViewModel(isMocked: true, title: "Houses List Test", urls: [EnvVars.baseUrl]))
    }
    
    func testGetCharacterFromModel() async {
        let testModel = GoTHouseRequest()
        await self.sut.vm.getHousesFromModel(request: testModel)
        
        let actualModel: [GoTHouseDto] = await self.sut.vm.model
        XCTAssertEqual(actualModel[0].url ?? "", "https://www.anapioficeandfire.com/api/houses/1")
        XCTAssertEqual(actualModel[0].name ?? "", "House Algood")
        XCTAssertEqual(actualModel[0].region ?? "", "The Westerlands")
        XCTAssertEqual(actualModel[0].coatOfArms ?? "", "A golden wreath, on a blue field with a gold border")
        XCTAssertEqual(actualModel[0].words ?? "", "")
        XCTAssertEqual(actualModel[0].titles ?? [], [])
        XCTAssertEqual(actualModel[0].seats ?? [], [])
        XCTAssertEqual(actualModel[0].currentLord ?? "", "")
        XCTAssertEqual(actualModel[0].heir ?? "", "")
        XCTAssertEqual(actualModel[0].overlord ?? "", "https://www.anapioficeandfire.com/api/houses/229")
        XCTAssertEqual(actualModel[0].founded ?? "", "")
        XCTAssertEqual(actualModel[0].founder ?? "", "")
        XCTAssertEqual(actualModel[0].diedOut ?? "", "")
        XCTAssertEqual(actualModel[0].ancestralWeapons ?? [], [])
        XCTAssertEqual(actualModel[0].cadetBranches ?? [], [])
        XCTAssertEqual(actualModel[0].swornMembers ?? [], [])
    }
    
    func testGetHousesFromUrls() async {
        let testModel = [EnvVars.baseUrl]
        await self.sut.vm.getHousesFromUrls(urls: testModel)
        
        let actualModel: [GoTHouseDto] = await self.sut.vm.model
        XCTAssertEqual(actualModel[0].url ?? "", "https://www.anapioficeandfire.com/api/houses/1")
        XCTAssertEqual(actualModel[0].name ?? "", "House Algood")
        XCTAssertEqual(actualModel[0].region ?? "", "The Westerlands")
        XCTAssertEqual(actualModel[0].coatOfArms ?? "", "A golden wreath, on a blue field with a gold border")
        XCTAssertEqual(actualModel[0].words ?? "", "")
        XCTAssertEqual(actualModel[0].titles ?? [], [])
        XCTAssertEqual(actualModel[0].seats ?? [], [])
        XCTAssertEqual(actualModel[0].currentLord ?? "", "")
        XCTAssertEqual(actualModel[0].heir ?? "", "")
        XCTAssertEqual(actualModel[0].overlord ?? "", "https://www.anapioficeandfire.com/api/houses/229")
        XCTAssertEqual(actualModel[0].founded ?? "", "")
        XCTAssertEqual(actualModel[0].founder ?? "", "")
        XCTAssertEqual(actualModel[0].diedOut ?? "", "")
        XCTAssertEqual(actualModel[0].ancestralWeapons ?? [], [])
        XCTAssertEqual(actualModel[0].cadetBranches ?? [], [])
        XCTAssertEqual(actualModel[0].swornMembers ?? [], [])
    }
    
    func testGetHousesFromPaginationUrls() async {
        let testModel = EnvVars.baseUrl
        await self.sut.vm.getHousesFromPaginationUrls(url: testModel)
        
        let actualModel: [GoTHouseDto] = await self.sut.vm.model
        XCTAssertEqual(actualModel[0].url ?? "", "https://www.anapioficeandfire.com/api/houses/1")
        XCTAssertEqual(actualModel[0].name ?? "", "House Algood")
        XCTAssertEqual(actualModel[0].region ?? "", "The Westerlands")
        XCTAssertEqual(actualModel[0].coatOfArms ?? "", "A golden wreath, on a blue field with a gold border")
        XCTAssertEqual(actualModel[0].words ?? "", "")
        XCTAssertEqual(actualModel[0].titles ?? [], [])
        XCTAssertEqual(actualModel[0].seats ?? [], [])
        XCTAssertEqual(actualModel[0].currentLord ?? "", "")
        XCTAssertEqual(actualModel[0].heir ?? "", "")
        XCTAssertEqual(actualModel[0].overlord ?? "", "https://www.anapioficeandfire.com/api/houses/229")
        XCTAssertEqual(actualModel[0].founded ?? "", "")
        XCTAssertEqual(actualModel[0].founder ?? "", "")
        XCTAssertEqual(actualModel[0].diedOut ?? "", "")
        XCTAssertEqual(actualModel[0].ancestralWeapons ?? [], [])
        XCTAssertEqual(actualModel[0].cadetBranches ?? [], [])
        XCTAssertEqual(actualModel[0].swornMembers ?? [], [])
    }

}
