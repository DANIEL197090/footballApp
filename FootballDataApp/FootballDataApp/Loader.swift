//
//  Loader.swift
//  FootballDataApp
//
//  Created by Ifeanyi Mbata on 2/1/25.
//

import UIKit
import Lottie

public class Loader: UIView {
    var animation: AnimationView!
    var animationFile = "loader"
    
    var loadingLabel: UILabel = {
        let label = UILabel()
        label.text = "Loading, Please wait..."
        label.font = UIFont(name: AppFonts.montserratBold.font, size: 18)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var blurView: UIView = {
        let effectView = UIView()
        effectView.backgroundColor = lightBackgroundColor
        effectView.translatesAutoresizingMaskIntoConstraints = false
        return effectView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        insertSubview(blurView, at: 0)
        blurView.fillSuperview()
        
        animation = AnimationView(name: animationFile)
        animation.loopMode = .loop
        animation.translatesAutoresizingMaskIntoConstraints = false
        addSubview(animation)
        animation.centerInSuperview(size: .init(width: 200, height: 100))
        
        addSubview(loadingLabel)
        NSLayoutConstraint.activate([
            loadingLabel.topAnchor.constraint(equalTo: animation.bottomAnchor, constant: 30),
            loadingLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            loadingLabel.widthAnchor.constraint(lessThanOrEqualTo: self.widthAnchor, constant: -40)
        ])
    }
    
    public static var shared: Loader {
        return Loader()
    }
    
    public func showLoader(withText text: String? = nil) {
        DispatchQueue.main.async {
            self.loadingLabel.text = text ?? "Loading, Please wait..."
            self.animation.play()
            
            guard let windowScene = UIApplication.shared.connectedScenes
                .filter({ $0.activationState == .foregroundActive })
                .compactMap({ $0 as? UIWindowScene })
                .first,
                  let window = windowScene.windows.first(where: { $0.isKeyWindow }) else {
                return
            }
            
            self.translatesAutoresizingMaskIntoConstraints = false
            self.tag = 91202
            
            window.addSubview(self)
            NSLayoutConstraint.activate([
                self.centerYAnchor.constraint(equalTo: window.centerYAnchor),
                self.centerXAnchor.constraint(equalTo: window.centerXAnchor),
                self.heightAnchor.constraint(equalTo: window.heightAnchor),
                self.widthAnchor.constraint(equalTo: window.widthAnchor)
            ])
        }
    }
    
    public func hideLoader() {
        DispatchQueue.main.async {
            guard let windowScene = UIApplication.shared.connectedScenes
                .filter({ $0.activationState == .foregroundActive })
                .compactMap({ $0 as? UIWindowScene })
                .first,
                let window = windowScene.windows.first(where: { $0.isKeyWindow }) else {
                return
            }
            
            if let loaderView = window.viewWithTag(91202) {
                loaderView.removeFromSuperview()
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

extension UIView {
    func fillSuperview() {
        guard let superview = superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superview.topAnchor),
            bottomAnchor.constraint(equalTo: superview.bottomAnchor),
            leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            trailingAnchor.constraint(equalTo: superview.trailingAnchor)
        ])
    }
    
}
