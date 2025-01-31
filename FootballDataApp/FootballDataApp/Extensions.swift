//
//  Extensions.swift
//  FootballDataApp
//
//  Created by mac on 1/31/25.
//

import UIKit
extension UIImage {
    func resized(to size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
        defer { UIGraphicsEndImageContext() }
        draw(in: CGRect(origin: .zero, size: size))
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}
extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0

        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgb & 0x0000FF) / 255.0

        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}
extension UILabel {
    class func customLabel(text: String, fontSize: CGFloat, fontFamily: String, textAlignment: NSTextAlignment, numberofLines: Int, textColor: UIColor) -> UILabel {
        let label = UILabel()
        label.textColor = textColor
        label.text = text
        label.textAlignment = textAlignment
        label.numberOfLines = numberofLines
        label.font = UIFont(name: fontFamily, size: fontSize)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
}
