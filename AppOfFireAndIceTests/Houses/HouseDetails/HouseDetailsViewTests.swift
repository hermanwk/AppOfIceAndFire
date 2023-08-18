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
        
        self.sut = HouseDetailsView(vm: HouseDetailsView.ViewModel(title: "House Details Test", house: GoTHouseDto()))
    }
}
