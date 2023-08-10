//
//  FontThemes.swift
//  AppOfFireAndIce
//
//  Created by Herman Willem Keuris on 2023/08/10.
//

import Foundation
import UIKit

enum FontName {
    case primaryRegular
    case primaryMedium
    case primaryBold
    case proDisplayMedium
    case proDisplayRegular
    case robotoRegular
    case robotoMedium
    case iconFont
}

class Fonts {
    static var app: Fonts = {
        Fonts()
    }()
    
    // Fonts
    let primaryRegular: String = "SFProText-Regular"
    let primaryMedium: String = "SFProText-Medium"
    let primaryBold: String = "SFProText-Bold"
    
    let proDisplayMedium: String = "SFProDisplay-Medium"
    let proDisplayRegular: String = "SFProDisplay-Regular"
    
    let robotoRegular: String = "Roboto-Regular"
    let robotoMedium: String = "Roboto-Medium"
    let iconFont: String = "SIL-D-APP-ICONFONT"
}

extension Fonts {
    func toArray() -> [FontName: String] {
        var dict = [FontName: String]()
        dict[FontName.primaryRegular] = self.primaryRegular
        dict[FontName.primaryMedium] = self.primaryMedium
        dict[FontName.primaryBold] = self.primaryBold
        dict[FontName.proDisplayMedium] = self.proDisplayMedium
        dict[FontName.proDisplayRegular] = self.proDisplayRegular
        dict[FontName.robotoRegular] = self.robotoRegular
        dict[FontName.robotoMedium] = self.robotoMedium
        dict[FontName.iconFont] = self.iconFont
        return dict
    }
}

enum FontSizeName {
    /// Size: 48
    case fontSizeXXXXLarge
    /// Size: 32
    case fontSizeXXXLarge
    /// Size: 24
    case fontSizeXXLarge
    /// Size: 20
    case fontSizeXLarge
    /// Size: 18
    case fontSizeLarge
    /// Size: 16.5
    case fontSizeMediumB
    /// Size: 16
    case fontSizeMedium
    /// Size: 14
    case fontSizeSmall
    /// Size: 12
    case fontSizeXSmall
    /// Size: 11
    case fontSizeXXSmall
    /// Size: 100
    case fontSizeIcon
}

class FontSizes {
    static var app: FontSizes = {
        FontSizes()
    }()
    
    // Font Sizes
    /// Size: 48
    let fontSizeXXXXLarge: CGFloat = 48
    /// Size: 32
    let fontSizeXXXLarge: CGFloat = 32
    /// Size: 24
    let fontSizeXXLarge: CGFloat = 24
    /// Size: 20
    let fontSizeXLarge: CGFloat = 20
    /// Size: 18
    let fontSizeLarge: CGFloat = 18
    /// Size: 16.5
    let fontSizeMediumB: CGFloat = 15
    /// Size: 16
    let fontSizeMedium: CGFloat = 16
    /// Size: 14
    let fontSizeSmall: CGFloat = 14
    /// Size: 12
    let fontSizeXSmall: CGFloat = 12
    /// Size: 11
    let fontSizeXXSmall: CGFloat = 11
    /// Size: 100
    let fontSizeIcon: CGFloat = 100
}

extension FontSizes {
    func toArray() -> [FontSizeName: CGFloat] {
        var dict = [FontSizeName: CGFloat]()
        dict[FontSizeName.fontSizeXXXXLarge] = self.fontSizeXXXXLarge
        dict[FontSizeName.fontSizeXXXLarge] = self.fontSizeXXXLarge
        dict[FontSizeName.fontSizeXXLarge] = self.fontSizeXXLarge
        dict[FontSizeName.fontSizeXLarge] = self.fontSizeXLarge
        dict[FontSizeName.fontSizeLarge] = self.fontSizeLarge
        dict[FontSizeName.fontSizeMediumB] = self.fontSizeMediumB
        dict[FontSizeName.fontSizeMedium] = self.fontSizeMedium
        dict[FontSizeName.fontSizeSmall] = self.fontSizeSmall
        dict[FontSizeName.fontSizeXSmall] = self.fontSizeXSmall
        dict[FontSizeName.fontSizeXXSmall] = self.fontSizeXXSmall
        dict[FontSizeName.fontSizeIcon] = self.fontSizeIcon
        return dict
    }
}
