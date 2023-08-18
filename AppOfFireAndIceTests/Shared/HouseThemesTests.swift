//
//  ThemeTests.swift
//  AppOfFireAndIceTests
//
//  Created by Herman Willem Keuris on 2023/08/18.
//

import XCTest
import SwiftUI

final class HouseThemesTests: XCTestCase {
    func testGetOverlordIcon() {
        let actualWesterlands = HouseThemes.getOverlordIcon(region: HouseType.westerlands.rawValue)
        let expectedWesterlands = "lannister"
        XCTAssertEqual(actualWesterlands, expectedWesterlands)
        
        let actualDorne = HouseThemes.getOverlordIcon(region: HouseType.dorne.rawValue)
        let expectedDorne = "martel"
        XCTAssertEqual(actualDorne, expectedDorne)
        
        let actualNorth = HouseThemes.getOverlordIcon(region: HouseType.north.rawValue)
        let expectedNorth = "stark"
        XCTAssertEqual(actualNorth, expectedNorth)
        
        let actualReach = HouseThemes.getOverlordIcon(region: HouseType.reach.rawValue)
        let expectedReach = "tyrel"
        XCTAssertEqual(actualReach, expectedReach)
        
        let actualVale = HouseThemes.getOverlordIcon(region: HouseType.vale.rawValue)
        let expectedVale = "arryn"
        XCTAssertEqual(actualVale, expectedVale)
        
        let actualCrownlands = HouseThemes.getOverlordIcon(region: HouseType.crownlands.rawValue)
        let expectedCrownlands = "king"
        XCTAssertEqual(actualCrownlands, expectedCrownlands)
        
        let actualStormlands = HouseThemes.getOverlordIcon(region: HouseType.stormlands.rawValue)
        let expectedStormlands = "baratheon"
        XCTAssertEqual(actualStormlands, expectedStormlands)
        
        let actualNeck = HouseThemes.getOverlordIcon(region: HouseType.neck.rawValue)
        let expectedNeck = "stark"
        XCTAssertEqual(actualNeck, expectedNeck)
        
        let actualRiverlands = HouseThemes.getOverlordIcon(region: HouseType.riverlands.rawValue)
        let expectedRiverlands = "tully"
        XCTAssertEqual(actualRiverlands, expectedRiverlands)
        
        let actualIronLands = HouseThemes.getOverlordIcon(region: HouseType.ironLands.rawValue)
        let expectedIronLands = "greyjoy"
        XCTAssertEqual(actualIronLands, expectedIronLands)
    }
    
    func testGetOverlordColor() {
        let actualWesterlands = HouseThemes.getOverlordColor(region: HouseType.westerlands.rawValue)
        let expectedWesterlands = Color.yellow
        XCTAssertEqual(actualWesterlands, expectedWesterlands)
        
        let actualDorne = HouseThemes.getOverlordColor(region: HouseType.dorne.rawValue)
        let expectedDorne = Color.orange
        XCTAssertEqual(actualDorne, expectedDorne)
        
        let actualNorth = HouseThemes.getOverlordColor(region: HouseType.north.rawValue)
        let expectedNorth = Color.white
        XCTAssertEqual(actualNorth, expectedNorth)
        
        let actualReach = HouseThemes.getOverlordColor(region: HouseType.reach.rawValue)
        let expectedReach = Color.green
        XCTAssertEqual(actualReach, expectedReach)
        
        let actualVale = HouseThemes.getOverlordColor(region: HouseType.vale.rawValue)
        let expectedVale = Color.teal
        XCTAssertEqual(actualVale, expectedVale)
        
        let actualCrownlands = HouseThemes.getOverlordColor(region: HouseType.crownlands.rawValue)
        let expectedCrownlands = Color.red
        XCTAssertEqual(actualCrownlands, expectedCrownlands)
        
        let actualStormlands = HouseThemes.getOverlordColor(region: HouseType.stormlands.rawValue)
        let expectedStormlands = Color.blue
        XCTAssertEqual(actualStormlands, expectedStormlands)
        
        let actualNeck = HouseThemes.getOverlordColor(region: HouseType.neck.rawValue)
        let expectedNeck = Color.white
        XCTAssertEqual(actualNeck, expectedNeck)
        
        let actualRiverlands = HouseThemes.getOverlordColor(region: HouseType.riverlands.rawValue)
        let expectedRiverlands = Color.purple
        XCTAssertEqual(actualRiverlands, expectedRiverlands)
        
        let actualIronLands = HouseThemes.getOverlordColor(region: HouseType.ironLands.rawValue)
        let expectedIronLands = Color.gray
        XCTAssertEqual(actualIronLands, expectedIronLands)
    }
}
