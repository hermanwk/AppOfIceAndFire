//
//  CharactersFilterViewTests.swift
//  AppOfFireAndIceTests
//
//  Created by Herman Willem Keuris on 2023/08/18.
//

import XCTest

final class CharactersFilterViewTests: XCTestCase {
    private var sut: CharactersFilterView!
    
    override func setUp() {
        super.setUp()
        
        self.sut = CharactersFilterView(vm: CharactersFilterView.ViewModel())
    }

    func testGetRequestName() {
        let actualEmpty = sut.vm.getRequest()
        let expectedEmpty = GoTCharacterRequest()
        XCTAssertEqual(actualEmpty.name, expectedEmpty.name)
        
        sut.vm.name = "Test name"
        let actualName = sut.vm.getRequest()
        let expectedName = GoTCharacterRequest(name: "Test name")
        XCTAssertEqual(actualName.name, expectedName.name)
    }
    
    func testGetRequestGender() {
        sut.vm.gender = 1
        let actualMale = sut.vm.getRequest()
        let expectedMale = GoTCharacterRequest(gender: "Male")
        XCTAssertEqual(actualMale.gender, expectedMale.gender)
        
        sut.vm.gender = 2
        let actualFemale = sut.vm.getRequest()
        let expectedFemale = GoTCharacterRequest(gender: "Female")
        XCTAssertEqual(actualFemale.gender, expectedFemale.gender)
        
        sut.vm.gender = 0
        let actualZero = sut.vm.getRequest()
        let expectedZero = GoTCharacterRequest()
        XCTAssertEqual(actualZero.gender, expectedZero.gender)
    }
    
    func testGetRequestCulture() {
        let actualEmpty = sut.vm.getRequest()
        let expectedEmpty = GoTCharacterRequest()
        XCTAssertEqual(actualEmpty.culture, expectedEmpty.culture)
        
        sut.vm.culture = "Test culture"
        let actualName = sut.vm.getRequest()
        let expectedName = GoTCharacterRequest(culture: "Test culture")
        XCTAssertEqual(actualName.culture, expectedName.culture)
    }
    
    func testGetRequestBorn() {
        let actualEmpty = sut.vm.getRequest()
        let expectedEmpty = GoTCharacterRequest()
        XCTAssertEqual(actualEmpty.born, expectedEmpty.born)
        
        sut.vm.born = "Test born"
        let actualName = sut.vm.getRequest()
        let expectedName = GoTCharacterRequest(born: "Test born")
        XCTAssertEqual(actualName.born, expectedName.born)
    }
    
    func testGetRequestDied() {
        let actualEmpty = sut.vm.getRequest()
        let expectedEmpty = GoTCharacterRequest()
        XCTAssertEqual(actualEmpty.died, expectedEmpty.died)
        
        sut.vm.died = "Test died"
        let actualName = sut.vm.getRequest()
        let expectedName = GoTCharacterRequest(died: "Test died")
        XCTAssertEqual(actualName.died, expectedName.died)
    }
    
    func testGetRequestIsAlive() {
        sut.vm.isAlive = 1
        let actualTrue = sut.vm.getRequest()
        let expectedTrue = GoTCharacterRequest(isAlive: true)
        XCTAssertEqual(actualTrue.isAlive, expectedTrue.isAlive)
        
        sut.vm.isAlive = 2
        let actualFalse = sut.vm.getRequest()
        let expectedFalse = GoTCharacterRequest(isAlive: false)
        XCTAssertEqual(actualFalse.isAlive, expectedFalse.isAlive)
        
        sut.vm.isAlive = 0
        let actualZero = sut.vm.getRequest()
        let expectedZero = GoTCharacterRequest()
        XCTAssertEqual(actualZero.isAlive, expectedZero.isAlive)
    }
    
    func testGetRequestPage() {
        let actualEmpty = sut.vm.getRequest()
        let expectedEmpty = GoTCharacterRequest()
        XCTAssertEqual(actualEmpty.page, expectedEmpty.page)
        
        sut.vm.page = 1
        let actualPage = sut.vm.getRequest()
        let expectedPage = GoTCharacterRequest(page: 1)
        XCTAssertEqual(actualPage.page, expectedPage.page)
    }
    
    func testGetRequestPageSize() {
        let actualEmpty = sut.vm.getRequest()
        let expectedEmpty = GoTCharacterRequest()
        XCTAssertEqual(actualEmpty.pageSize, expectedEmpty.pageSize)
        
        sut.vm.page = 1
        let actualPage = sut.vm.getRequest()
        let expectedPage = GoTCharacterRequest(page: 1)
        XCTAssertEqual(actualPage.page, expectedPage.page)
    }
}
