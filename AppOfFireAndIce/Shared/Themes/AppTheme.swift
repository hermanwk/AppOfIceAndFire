//
//  AppTheme.swift
//  AppOfFireAndIce
//
//  Created by Herman Willem Keuris on 2023/08/10.
//

import Foundation
import SwiftUI

struct AppTheme {
    var colors: [ColorName: Color] = [:]
    var fonts: [FontName: String] = [:]
    var fontSizes: [FontSizeName: CGFloat] = [:]
}

extension AppTheme {
    func color(_ name:ColorName) -> Color {
        let ret =  colors.first(where: { $0.key == name })
        return ret?.value ?? Color.red
    }
    
    func font(_ name:FontName) -> String {
        let ret =  fonts.first(where: { $0.key == name })
        return ret?.value ?? ""
    }
    
    func fontSize(_ name:FontSizeName) -> CGFloat {
        let ret =  fontSizes.first(where: { $0.key == name })
        return ret?.value ?? 8
    }
}

extension AppTheme {
    static var preview: AppTheme {
        let theme = AppTheme(colors: ColorThemes.app.toColorArray(), fonts: Fonts.app.toArray(), fontSizes: FontSizes.app.toArray())
        return theme
    }
}
