//
//  HouseThemes.swift
//  AppOfFireAndIce
//
//  Created by Herman Willem Keuris on 2023/08/17.
//

import Foundation
import SwiftUI

public enum HouseType: String {
    case westerlands = "The Westerlands"
    case dorne = "Dorne"
    case north = "The North"
    case reach = "The Reach"
    case vale = "The Vale"
    case crownlands = "The Crownlands"
    case stormlands = "The Stormlands"
    case neck = "The Neck"
    case riverlands = "The Riverlands"
    case ironLands = "Iron Islands"
}

public enum GenderType: String {
    case male = "Male"
    case female = "Female"
}

public enum BookType: String {
    case graphicNovel = "GraphicNovel"
    case paperback = "Paperback"
    case hardcover = "Hardcover"
    case hardback = "Hardback"
}

public enum BookName: String {
    case gameOfThrones = "A Game of Thrones"
    case stormSwords = "A Storm of Swords"
    case clashOfKings = "A Clash of Kings"
    case feastOfCrows = "A Feast for Crows"
    case danceWithDragons = "A Dance with Dragons"
    case hedgeKnight = "The Hedge Knight"
    case swornSword = "The Sworn Sword"
    case mysteryKnight = "The Mystery Knight"
    case princessAndQueen = "The Princess and the Queen"
    case roguePrince = "The Rogue Prince"
    case worldIceFire = "The World of Ice and Fire"
    case knightSevenKingdoms = "A Knight of the Seven Kingdoms"
}

public struct HouseThemes {
    static func getOverlordIcon(region: String) -> String {
        switch region {
        case HouseType.westerlands.rawValue:
            return "lannister"
        case HouseType.dorne.rawValue:
            return "martel"
        case HouseType.north.rawValue:
            return "stark"
        case HouseType.reach.rawValue:
            return "tyrel"
        case HouseType.vale.rawValue:
            return "arryn"
        case HouseType.crownlands.rawValue:
            return "king"
        case HouseType.stormlands.rawValue:
            return "baratheon"
        case HouseType.neck.rawValue:
            return "stark"
        case HouseType.riverlands.rawValue:
            return "tully"
        case HouseType.ironLands.rawValue:
            return "greyjoy"
        default:
            return "houses"
        }
    }
    
    static func getOverlordColor(region: String) -> Color {
        switch region {
        case HouseType.westerlands.rawValue:
            return Color.yellow
        case HouseType.dorne.rawValue:
            return Color.orange
        case HouseType.north.rawValue:
            return Color.white
        case HouseType.reach.rawValue:
            return Color.green
        case HouseType.vale.rawValue:
            return Color.teal
        case HouseType.crownlands.rawValue:
            return Color.red
        case HouseType.stormlands.rawValue:
            return Color.blue
        case HouseType.neck.rawValue:
            return Color.white
        case HouseType.riverlands.rawValue:
            return Color.purple
        case HouseType.ironLands.rawValue:
            return Color.gray
        default:
            return Color.pink
        }
    }
}

public struct CharacterThemes {
    static func getGenderIcon(gender: String) -> String {
        switch gender {
        case "Male":
            return "male"
        case "Female":
            return "female"
        default:
            return "unknownGender"
        }
    }
    
    static func getCharacterColor(gender: String) -> Color {
        switch gender {
        case GenderType.male.rawValue:
            return Color.blue
        case GenderType.female.rawValue:
            return Color.pink
        default:
            return Color.green
        }
    }
    
    static func getCharacterIdentifier(character: GoTCharacterDto?) -> [String] {
        if (character == nil) {
            return ["", ""]
        } else if (!(character?.name?.isEmpty ?? true)) {
            return ["Name", character?.name ?? ""]
        } else {
            return ["Aliases", character?.aliases?.joined(separator:", ") ?? ""]
        }
    }
}

public struct BookThemes {
    static func getBookIcon(book: String) -> String {
        switch book {
        case BookType.graphicNovel.rawValue:
            return "blackSpear"
        case BookType.paperback.rawValue:
            return "iceKnife"
        default:
            return "flameSword"
        }
    }
    
    static func getBookColor(book: String) -> Color {
        switch book {
        case BookName.gameOfThrones.rawValue:
            return Color.yellow
        case BookName.stormSwords.rawValue:
            return Color.blue
        case BookName.clashOfKings.rawValue:
            return Color.green
        case BookName.feastOfCrows.rawValue:
            return Color.red
        case BookName.danceWithDragons.rawValue:
            return Color.cyan
        case BookName.hedgeKnight.rawValue:
            return Color.teal
        case BookName.swornSword.rawValue:
            return Color.red
        case BookName.mysteryKnight.rawValue:
            return Color.blue
        case BookName.princessAndQueen.rawValue:
            return Color.purple
        case BookName.roguePrince.rawValue:
            return Color.red
        case BookName.worldIceFire.rawValue:
            return Color.purple
        case BookName.knightSevenKingdoms.rawValue:
            return Color.orange
        default:
            return Color.cyan
        }
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
}
