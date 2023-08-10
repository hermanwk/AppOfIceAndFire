//
//  GoTCharacter.swift
//  AppOfFireAndIce
//
//  Created by Herman Willem Keuris on 2023/08/09.
//

import Foundation

class GoTCharacterModel: IGoTObject {
    var isLoaded: Bool
    var url: String?
    var data: GoTCharacterDto?
    
    public required init(data: GoTCharacterDto) {
        self.isLoaded = true
        self.url = data.url
        self.data = data
    }
    
    public required init(url: String) {
        self.isLoaded = false
        self.url = url
        self.data = nil
    }
}
