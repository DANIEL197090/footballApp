//
//  Colors.swift
//  FootballDataApp
//
//  Created by mac on 1/31/25.
//

import UIKit
import Foundation
enum AppColors {
    
    case white
    case black
    case greenAccentBackground
    case primaryGreen
    case offWhite
    case placeHolder
    case fairBlack
    case darkGreen
    
    var color: UIColor {
        switch self {
        case .fairBlack:
            return  UIColor(hex: "#212121", alpha: 1.0)
        case .white:
            return UIColor(hex: "#FFFFFF", alpha: 1.0)
        case .black:
            return UIColor(hex: "#000000", alpha: 1.0)
        case .greenAccentBackground:
            return UIColor(hex: "#EBFAEF", alpha: 1.0)
        case .primaryGreen:
            return UIColor(hex: "#43B15F", alpha: 1.0)
        case .offWhite:
            return UIColor(hex: "#F7F9FA", alpha: 1.0)
        case .placeHolder:
            return UIColor(hex: "#B6C3CC", alpha: 1.0)
        case .darkGreen:
            return UIColor(hex: "#328547", alpha: 1.0)
        
        }
        
    }
}
var backgroundSystemColor : UIColor {
    return UIColor { (trait) -> UIColor in
        switch trait.userInterfaceStyle {
        case .dark:
            return AppColors.black.color
        default:
            return  AppColors.offWhite.color
        }
    }
}
var appTextColor : UIColor {
    return UIColor { (trait) -> UIColor in
        switch trait.userInterfaceStyle {
        case .dark:
            return  AppColors.white.color
        default:
            return  AppColors.black.color
        }
    }
}
