//
//  CharacterThemesTests.swift
//  AppOfFireAndIceTests
//
//  Created by Herman Willem Keuris on 2023/08/18.
//

import XCTest
import SwiftUI

final class CharacterThemesTests: XCTestCase {
    func testGetGenderIcon() {
        let actualMale = CharacterThemes.getGenderIcon(gender: GenderType.male.rawValue)
        let expectedMale = "male"
        XCTAssertEqual(actualMale, expectedMale)
        
        let actualFemale = CharacterThemes.getGenderIcon(gender: GenderType.female.rawValue)
        let expectedFemale = "female"
        XCTAssertEqual(actualFemale, expectedFemale)
        
        let actualUnknown = CharacterThemes.getGenderIcon(gender: "")
        let expectedUnknown = "unknownGender"
        XCTAssertEqual(actualUnknown, expectedUnknown)
    }
    
    func testGetCharacterColor() {
        let actualMale = CharacterThemes.getCharacterColor(gender: GenderType.male.rawValue)
        let expectedMale = Color.blue
        XCTAssertEqual(actualMale, expectedMale)
        
        let actualFemale = CharacterThemes.getCharacterColor(gender: GenderType.female.rawValue)
        let expectedFemale = Color.pink
        XCTAssertEqual(actualFemale, expectedFemale)
        
        let actualUnknown = CharacterThemes.getCharacterColor(gender: "")
        let expectedUnknown = Color.green
        XCTAssertEqual(actualUnknown, expectedUnknown)
    }
    
    func testGetCharacterIdentifier() {
        let actualEmpty = CharacterThemes.getCharacterIdentifier(character: nil)
        let expectedEmpty = ["", ""]
        XCTAssertEqual(actualEmpty, expectedEmpty)
        
        let actualName = CharacterThemes.getCharacterIdentifier(character: GoTCharacterDto(name: "Test name"))
        let expectedName = ["Name", "Test name"]
        XCTAssertEqual(actualName, expectedName)
        
        let actualAlias = CharacterThemes.getCharacterIdentifier(character: GoTCharacterDto(aliases: ["Test alias one", "Test alias two"]))
        let expectedAlias = ["Aliases", "Test alias one, Test alias two"]
        XCTAssertEqual(actualAlias, expectedAlias)
    }
}
