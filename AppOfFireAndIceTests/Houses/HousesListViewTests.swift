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
        self.sut = HousesListView(vm: HousesListView.ViewModel(title: "Houses Tests"))
    }
}
