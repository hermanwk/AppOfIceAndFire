//
//  BookThemesTests.swift
//  AppOfFireAndIceTests
//
//  Created by Herman Willem Keuris on 2023/08/18.
//

import XCTest
import SwiftUI

final class BookThemesTests: XCTestCase {
    func testGetBookIcon() {
        let actualGraphicNovel = BookThemes.getBookIcon(book: BookType.graphicNovel.rawValue)
        let expectedGraphicNovel = "blackSpear"
        XCTAssertEqual(actualGraphicNovel, expectedGraphicNovel)
        
        let actualPaperback = BookThemes.getBookIcon(book: BookType.paperback.rawValue)
        let expectedPaperback = "iceKnife"
        XCTAssertEqual(actualPaperback, expectedPaperback)
        
        let actualHardback = BookThemes.getBookIcon(book: BookType.hardback.rawValue)
        let expectedHardback = "flameSword"
        XCTAssertEqual(actualHardback, expectedHardback)
        
        let actualHardcover = BookThemes.getBookIcon(book: BookType.hardcover.rawValue)
        let expectedHardcover = "flameSword"
        XCTAssertEqual(actualHardcover, expectedHardcover)
    }
    
    func testGetBookColor() {
        let actualGameOfThrones = BookThemes.getBookColor(book: BookName.gameOfThrones.rawValue)
        let expectedGameOfThrones = Color.yellow
        XCTAssertEqual(actualGameOfThrones, expectedGameOfThrones)
        
        let actualStormSwords = BookThemes.getBookColor(book: BookName.stormSwords.rawValue)
        let expectedStormSwords = Color.blue
        XCTAssertEqual(actualStormSwords, expectedStormSwords)
        
        let actualClashOfKings = BookThemes.getBookColor(book: BookName.clashOfKings.rawValue)
        let expectedClashOfKings = Color.green
        XCTAssertEqual(actualClashOfKings, expectedClashOfKings)
        
        let actualFeastOfCrows = BookThemes.getBookColor(book: BookName.feastOfCrows.rawValue)
        let expectedFeastOfCrows = Color.red
        XCTAssertEqual(actualFeastOfCrows, expectedFeastOfCrows)
        
        let actualDanceWithDragons = BookThemes.getBookColor(book: BookName.danceWithDragons.rawValue)
        let expectedDanceWithDragons = Color.cyan
        XCTAssertEqual(actualDanceWithDragons, expectedDanceWithDragons)
        
        let actualHedgeKnight = BookThemes.getBookColor(book: BookName.hedgeKnight.rawValue)
        let expectedHedgeKnight = Color.teal
        XCTAssertEqual(actualHedgeKnight, expectedHedgeKnight)
        
        let actualSwornSword = BookThemes.getBookColor(book: BookName.swornSword.rawValue)
        let expectedSwornSword = Color.red
        XCTAssertEqual(actualSwornSword, expectedSwornSword)
        
        let actualMysteryKnight = BookThemes.getBookColor(book: BookName.mysteryKnight.rawValue)
        let expectedMysteryKnight = Color.blue
        XCTAssertEqual(actualMysteryKnight, expectedMysteryKnight)
        
        let actualPrincessAndQueen = BookThemes.getBookColor(book: BookName.princessAndQueen.rawValue)
        let expectedPrincessAndQueen = Color.purple
        XCTAssertEqual(actualPrincessAndQueen, expectedPrincessAndQueen)
        
        let actualRoguePrince = BookThemes.getBookColor(book: BookName.roguePrince.rawValue)
        let expectedRoguePrince = Color.red
        XCTAssertEqual(actualRoguePrince, expectedRoguePrince)
        
        let actualWorldIceFire = BookThemes.getBookColor(book: BookName.worldIceFire.rawValue)
        let expectedWorldIceFire  = Color.purple
        XCTAssertEqual(actualWorldIceFire, expectedWorldIceFire)
        
        let actualKnightSevenKingdoms = BookThemes.getBookColor(book: BookName.knightSevenKingdoms.rawValue)
        let expectedKnightSevenKingdoms = Color.orange
        XCTAssertEqual(actualKnightSevenKingdoms, expectedKnightSevenKingdoms)
    }
    
    static func getBookImage(book: String) -> String {
        switch book {
        case BookName.gameOfThrones.rawValue:
            return "gameOfThrones"
        case BookName.stormSwords.rawValue:
            return "stormSwords"
        case BookName.clashOfKings.rawValue:
            return "clashOfKings"
        case BookName.feastOfCrows.rawValue:
            return "feastOfCrows"
        case BookName.danceWithDragons.rawValue:
            return "danceWithDragons"
        case BookName.hedgeKnight.rawValue:
            return "hedgeKnightComic"
        case BookName.swornSword.rawValue:
            return "swornSword"
        case BookName.mysteryKnight.rawValue:
            return "mysteryKnight"
        case BookName.princessAndQueen.rawValue:
            return "princessAndQueen"
        case BookName.roguePrince.rawValue:
            return "roguePrince"
        case BookName.worldIceFire.rawValue:
            return "worldIceFire"
        case BookName.knightSevenKingdoms.rawValue:
            return "knightSeven"
        default:
            return ""
        }
    }
    
    func testGetBookImage() {
        let actualGameOfThrones = BookThemes.getBookImage(book: BookName.gameOfThrones.rawValue)
        let expectedGameOfThrones = "gameOfThrones"
        XCTAssertEqual(actualGameOfThrones, expectedGameOfThrones)
        
        let actualStormSwords = BookThemes.getBookImage(book: BookName.stormSwords.rawValue)
        let expectedStormSwords = "stormSwords"
        XCTAssertEqual(actualStormSwords, expectedStormSwords)
        
        let actualClashOfKings = BookThemes.getBookImage(book: BookName.clashOfKings.rawValue)
        let expectedClashOfKings = "clashOfKings"
        XCTAssertEqual(actualClashOfKings, expectedClashOfKings)
        
        let actualFeastOfCrows = BookThemes.getBookImage(book: BookName.feastOfCrows.rawValue)
        let expectedFeastOfCrows = "feastOfCrows"
        XCTAssertEqual(actualFeastOfCrows, expectedFeastOfCrows)
        
        let actualDanceWithDragons = BookThemes.getBookImage(book: BookName.danceWithDragons.rawValue)
        let expectedDanceWithDragons = "danceWithDragons"
        XCTAssertEqual(actualDanceWithDragons, expectedDanceWithDragons)
        
        let actualHedgeKnight = BookThemes.getBookImage(book: BookName.hedgeKnight.rawValue)
        let expectedHedgeKnight = "hedgeKnightComic"
        XCTAssertEqual(actualHedgeKnight, expectedHedgeKnight)
        
        let actualSwornSword = BookThemes.getBookImage(book: BookName.swornSword.rawValue)
        let expectedSwornSword = "swornSword"
        XCTAssertEqual(actualSwornSword, expectedSwornSword)
        
        let actualMysteryKnight = BookThemes.getBookImage(book: BookName.mysteryKnight.rawValue)
        let expectedMysteryKnight = "mysteryKnight"
        XCTAssertEqual(actualMysteryKnight, expectedMysteryKnight)
        
        let actualPrincessAndQueen = BookThemes.getBookImage(book: BookName.princessAndQueen.rawValue)
        let expectedPrincessAndQueen = "princessAndQueen"
        XCTAssertEqual(actualPrincessAndQueen, expectedPrincessAndQueen)
        
        let actualRoguePrince = BookThemes.getBookImage(book: BookName.roguePrince.rawValue)
        let expectedRoguePrince = "roguePrince"
        XCTAssertEqual(actualRoguePrince, expectedRoguePrince)
        
        let actualWorldIceFire = BookThemes.getBookImage(book: BookName.worldIceFire.rawValue)
        let expectedWorldIceFire  = "worldIceFire"
        XCTAssertEqual(actualWorldIceFire, expectedWorldIceFire)
        
        let actualKnightSevenKingdoms = BookThemes.getBookImage(book: BookName.knightSevenKingdoms.rawValue)
        let expectedKnightSevenKingdoms = "knightSeven"
        XCTAssertEqual(actualKnightSevenKingdoms, expectedKnightSevenKingdoms)
    }
}
