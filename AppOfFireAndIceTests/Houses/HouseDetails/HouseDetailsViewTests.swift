//
//  HouseDetailsViewTests.swift
//  AppOfFireAndIceTests
//
//  Created by Herman Willem Keuris on 2023/08/18.
//

import XCTest

final class HouseDetailsViewTests: XCTestCase {
    private var sut: HouseDetailsView!
    
    override func setUp() {
        super.setUp()
        
        self.sut = HouseDetailsView(vm: HouseDetailsView.ViewModel(isMocked: true, title: "House Details Test", url: EnvVars.baseUrl))
    }
    
    func testGetHouseDetails() async {
        self.sut.vm.getHouseDetails()
        do {
            while (self.sut.vm.model == nil) {
                try await Task.sleep(nanoseconds: 500)
            }
        } catch {
            super.record(XCTIssue(type: .assertionFailure, compactDescription: "Failed to set timer"))
        }
        
        let actualModel: GoTHouseDto? = self.sut.vm.model
        XCTAssertEqual(actualModel?.url ?? "", "https://www.anapioficeandfire.com/api/houses/1")
        XCTAssertEqual(actualModel?.name ?? "", "House Algood")
        XCTAssertEqual(actualModel?.region ?? "", "The Westerlands")
        XCTAssertEqual(actualModel?.coatOfArms ?? "", "A golden wreath, on a blue field with a gold border")
        XCTAssertEqual(actualModel?.words ?? "", "")
        XCTAssertEqual(actualModel?.titles ?? [], [])
        XCTAssertEqual(actualModel?.seats ?? [], [])
        XCTAssertEqual(actualModel?.currentLord ?? "", "")
        XCTAssertEqual(actualModel?.heir ?? "", "")
        XCTAssertEqual(actualModel?.overlord ?? "", "https://www.anapioficeandfire.com/api/houses/229")
        XCTAssertEqual(actualModel?.founded ?? "", "")
        XCTAssertEqual(actualModel?.founder ?? "", "")
        XCTAssertEqual(actualModel?.diedOut ?? "", "")
        XCTAssertEqual(actualModel?.ancestralWeapons ?? [], [])
        XCTAssertEqual(actualModel?.cadetBranches ?? [], [])
        XCTAssertEqual(actualModel?.swornMembers ?? [], [])
    }

}
