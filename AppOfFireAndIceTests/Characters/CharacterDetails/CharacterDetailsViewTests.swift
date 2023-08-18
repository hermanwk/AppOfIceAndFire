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
        
        self.sut = CharacterDetailsView(vm: CharacterDetailsView.ViewModel(title: "Character Details Test", character: GoTCharacterDto()))
    }
}
