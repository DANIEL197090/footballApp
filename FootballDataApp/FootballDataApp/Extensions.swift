//
//  Extensions.swift
//  FootballDataApp
//
//  Created by Ifeanyi Mbata on 1/31/25.
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
extension  UIButton {
    class func backButtonDesign() -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 32).isActive = true
        button.widthAnchor.constraint(equalToConstant: 32).isActive = true
        button.layer.cornerRadius = 16
        button.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        button.tintColor = appTextColor
        return button
    }
    class func plainButtonDesign(withText: String, backgroundColor: UIColor, titleColor: UIColor, borderWidth: CGFloat, buttonRadius: CGFloat, buttonFontFamily: String, buttonFontSize: CGFloat, buttonHeight: CGFloat ) -> UIButton {
        let button = UIButton()
        button.setTitle(withText, for: .normal)
        button.backgroundColor = backgroundColor
        button.setTitleColor(titleColor, for: .normal)
        button.layer.cornerRadius = buttonRadius
        button.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
        button.layer.borderWidth = borderWidth
        button.titleLabel?.font = UIFont(name: buttonFontFamily, size:  buttonFontSize)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
}
public extension UIViewController {
    func pop(numberOfTimes: Int) {
        guard let navigationController = navigationController else {
            print("No navigation controller")
            return
        }
        let viewControllers = navigationController.viewControllers
        let index = numberOfTimes + 1
        if viewControllers.count >= index {
            navigationController.popToViewController(viewControllers[viewControllers.count - index], animated: true)
        }
    }
}
extension UIView {
    class func viewDesign(cornerRadius: CGFloat, backgroundColor: UIColor) ->UIView {
        let view =  UIView()
        view.backgroundColor =  backgroundColor
        view.layer.cornerRadius = cornerRadius
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
}
extension UIStackView {
    class func customVerticalStackView(distribution: UIStackView.Distribution, views: [UIView], spacing: CGFloat) -> UIStackView {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .clear
        stackView.axis = .vertical
        stackView.distribution = distribution
        stackView.spacing = spacing
        
        // Add each view to the stackView
        views.forEach { view in
            stackView.addArrangedSubview(view)
        }
        
        return stackView
    }
    class func customHorizontalStackView(distribution: Distribution, views: [UIView], spacing: CGFloat) ->  UIStackView {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .clear
        stackView.axis = .horizontal
        stackView.distribution = distribution
        stackView.spacing = spacing
        
        // Add each view to the stackView
        views.forEach { view in
            stackView.addArrangedSubview(view)
        }
        
        return stackView
    }
}
extension UIView {
    func addSubViews(_ views: UIView...) {
        views.forEach{self.addSubview($0)}
    }
}
