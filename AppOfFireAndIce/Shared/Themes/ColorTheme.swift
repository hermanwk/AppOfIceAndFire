//
//  ColorTheme.swift
//  AppOfFireAndIce
//
//  Created by Herman Willem Keuris on 2023/08/10.
//

import Foundation
import UIKit
import SwiftUI

enum ColorName {
    case orangePrimaryColor
    case orangeSecondaryColor
    case orangeTertiaryColor
    case darkGray
    case mediumGray
    case lightGray
    case blueGray
}

class ColorThemes {
    static var app: ColorThemes = {
        ColorThemes()
    }()
    
    let orangePrimaryColor = UIColor(red: 1.00, green: 0.27, blue: 0.00, alpha: 1.00)
    let orangeSecondaryColor = UIColor(red: 1.00, green: 0.55, blue: 0.00, alpha: 1.00)
    let orangeTertiaryColor = UIColor(red: 1.00, green: 0.65, blue: 0.00, alpha: 1.00)
    
    // Grays
    let darkGray = UIColor(red: 0.13, green: 0.13, blue: 0.13, alpha: 1)
    let mediumGray = UIColor.darkGray
    let lightGray = UIColor.gray
    let blueGray = UIColor(red: 0.86, green: 0.86, blue: 0.86, alpha: 1)
}

extension ColorThemes {
    func toColorArray() -> [ColorName: Color] {
        var dict = [ColorName: Color]()
        dict[ColorName.orangePrimaryColor] = Color(self.orangePrimaryColor)
        dict[ColorName.orangeSecondaryColor] = Color(self.orangeSecondaryColor)
        dict[ColorName.orangeTertiaryColor] = Color(self.orangeTertiaryColor)
        dict[ColorName.darkGray] = Color(self.darkGray)
        dict[ColorName.mediumGray] = Color(self.mediumGray)
        dict[ColorName.lightGray] = Color(self.lightGray)
        dict[ColorName.blueGray] = Color(self.blueGray)
        return dict
    }
}

class ShadowThemes {
    static var app: ShadowThemes = {
        ShadowThemes()
    }()
    
    /// Opacity: 0.12
    let lightShadow: Float = 0.12
    
    /// Opacity: 0.24
    let heavyShadow: Float = 0.24
}
