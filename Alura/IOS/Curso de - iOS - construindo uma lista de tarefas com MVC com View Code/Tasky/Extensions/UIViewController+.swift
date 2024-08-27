//
//  UIViewController+.swift
//  Tasky
//
//  Created by Giovanna Moeller on 28/05/24.
//

import UIKit

extension UIViewController {
    func addGradientBackground() {
        let gradientBackground = CAGradientLayer()
        gradientBackground.frame = view.bounds
        gradientBackground.colors = [UIColor.white.cgColor, UIColor(named: AssetsConstants.lilac)?.cgColor ?? UIColor.purple.cgColor]
        view.layer.insertSublayer(gradientBackground, at: 0)
    }
}
