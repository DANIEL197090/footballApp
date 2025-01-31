//
//  Fonts.swift
//  FootballDataApp
//
//  Created by mac on 1/31/25.
//

import Foundation
// MARK: - ... Enum for holding fonts
enum AppFonts {
    case montserratBold
    case montserratRegular
    var font: String {
        switch self {
        case .montserratBold:
            return "Montserrat-Bold"
        case .montserratRegular:
            return "Montserrat-Regular"
        }
    }
}
