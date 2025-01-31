//
//  Toast.swift
//  FootballDataApp
//
//  Created by mac on 1/31/25.
//

import UIKit
public class Constant {
    public  static func lightHaptic(){
        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.impactOccurred()
    }
    public static func notchHeight() -> CGFloat{
        return UIApplication.shared.statusBarFrame.height
    }

}
public enum ToastType{
    case success, error, info
}

public class Toast: UIView {
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 3
        label.font = UIFont(name: AppFonts.montserratBold.font, size: 13)
        label.textColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00)
        return label
    }()
    var type: ToastType = .success{
        didSet{
            switch (type) {
            case .error:
                backgroundColor = UIColor(red: 1.0, green: 105.0 / 255.0, blue: 0.0, alpha: 1.0)
                break
            case .success:
                backgroundColor = UIColor(red: 136.0 / 255.0, green: 194.0 / 255.0, blue: 65.0 / 255.0, alpha: 1.0)
                break
            case .info:
                backgroundColor = .darkGray
                break
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(titleLabel)
        titleLabel.anchor(top: safeAreaLayoutGuide.topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor,padding: .init(top: 3, left: 20, bottom: 0, right: 5))
        self.isUserInteractionEnabled = true
        titleLabel.isUserInteractionEnabled = true
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapToast)))
        titleLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapToast)))
        //        closebutton.addTarget(self, action: #selector(didTapToast), for: .touchUpInside)
    }
    override public func layoutSubviews() {
        super.layoutSubviews()
    }
 //   let currentWindow = UIApplication.shared.keyWindow
    public static var shared = Toast()
    @objc func didTapToast(){
        Constant.lightHaptic()
        //        selected = true
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: [], animations: {
            self.transform = .init(scaleX: 0.95, y: 0.95)
            UIView.animate(withDuration: 0.4, delay: 0.3, options: [], animations: {
                self.transform = .identity
                self.beginHideToast()
            }, completion: nil)
        })
        
    }
    public func hideToast() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.beginHideToast()
        }
    }
    private func beginHideToast(){
        UIView.animate(withDuration: 0.9, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: [], animations: {
            self.transform = .init(translationX: 0, y: -200)
        }, completion: nil)
    }
    public func showToastWithTItle(_ title: String, type: ToastType){
        Constant.lightHaptic()
        self.type = type
        self.titleLabel.text = title
        guard let window = UIApplication.shared.keyWindow else { return }
        window.addSubview(self)
        window.bringSubviewToFront(self)
        self.anchor(top: window.topAnchor, leading: window.leadingAnchor, bottom: nil, trailing: window.trailingAnchor,padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: Constant.notchHeight() + 50))
        
        self.transform = .init(translationX: 0, y: -200)
        UIView.animate(withDuration: 0.5, delay: 0, options: [], animations: {
            self.transform = .identity
        }, completion: nil)
        hideToast()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

public extension UIView {
    
    @discardableResult
    func anchor(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero) -> AnchoredConstraints {
        
        translatesAutoresizingMaskIntoConstraints = false
        var anchoredConstraints = AnchoredConstraints()
        
        if let top = top {
            anchoredConstraints.top = topAnchor.constraint(equalTo: top, constant: padding.top)
        }
        
        if let leading = leading {
            anchoredConstraints.leading = leadingAnchor.constraint(equalTo: leading, constant: padding.left)
        }
        
        if let bottom = bottom {
            anchoredConstraints.bottom = bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom)
        }
        
        if let trailing = trailing {
            anchoredConstraints.trailing = trailingAnchor.constraint(equalTo: trailing, constant: -padding.right)
        }
        
        if size.width != 0 {
            anchoredConstraints.width = widthAnchor.constraint(equalToConstant: size.width)
        }
        
        if size.height != 0 {
            anchoredConstraints.height = heightAnchor.constraint(equalToConstant: size.height)
        }
        
        [anchoredConstraints.top, anchoredConstraints.leading, anchoredConstraints.bottom, anchoredConstraints.trailing, anchoredConstraints.width, anchoredConstraints.height].forEach{ $0?.isActive = true }
        
        return anchoredConstraints
    }
    func centerInViewX(top: NSLayoutYAxisAnchor?, bottom: NSLayoutYAxisAnchor?,padding: UIEdgeInsets = .zero, size: CGSize = .zero){
        translatesAutoresizingMaskIntoConstraints = false
        guard let superView = superview else { return }
        centerXAnchor.constraint(equalTo: superView.centerXAnchor).isActive = true
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        }
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
    func fillSuperview(padding: UIEdgeInsets = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        if let superviewTopAnchor = superview?.topAnchor {
            topAnchor.constraint(equalTo: superviewTopAnchor, constant: padding.top).isActive = true
        }
        
        if let superviewBottomAnchor = superview?.bottomAnchor {
            bottomAnchor.constraint(equalTo: superviewBottomAnchor, constant: -padding.bottom).isActive = true
        }
        
        if let superviewLeadingAnchor = superview?.leadingAnchor {
            leadingAnchor.constraint(equalTo: superviewLeadingAnchor, constant: padding.left).isActive = true
        }
        
        if let superviewTrailingAnchor = superview?.trailingAnchor {
            trailingAnchor.constraint(equalTo: superviewTrailingAnchor, constant: -padding.right).isActive = true
        }
    }
    
    func centerInSuperview(size: CGSize = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        if let superviewCenterXAnchor = superview?.centerXAnchor {
            centerXAnchor.constraint(equalTo: superviewCenterXAnchor).isActive = true
        }
        
        if let superviewCenterYAnchor = superview?.centerYAnchor {
            centerYAnchor.constraint(equalTo: superviewCenterYAnchor).isActive = true
        }
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
    
    func centerXInSuperview() {
        translatesAutoresizingMaskIntoConstraints = false
        if let superViewCenterXAnchor = superview?.centerXAnchor {
            centerXAnchor.constraint(equalTo: superViewCenterXAnchor).isActive = true
        }
    }
    
    func centerYInSuperview() {
        translatesAutoresizingMaskIntoConstraints = false
        if let centerY = superview?.centerYAnchor {
            centerYAnchor.constraint(equalTo: centerY).isActive = true
        }
    }
    
    func constrainWidth(constant: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: constant).isActive = true
    }
    
    func constrainHeight(constant: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: constant).isActive = true
    }
}
public struct AnchoredConstraints {
    var top, leading, bottom, trailing, width, height: NSLayoutConstraint?
}

