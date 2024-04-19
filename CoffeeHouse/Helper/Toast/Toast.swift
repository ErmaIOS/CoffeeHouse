//
//  Toast.swift
//  CoffeeHouse
//
//  Created by Erma on 19/4/24.
//


import UIKit
extension UIViewController {
    func showToast(message: String, font: UIFont) {
        let toastHeight: CGFloat = 54
        let toastWidth = self.view.frame.size.width - 32
        let toastLabel = UILabel(frame: CGRect(x: 16, y: -toastHeight, width: toastWidth, height: toastHeight))
        toastLabel.backgroundColor = UIColor(hex: "#ECECEC")
        toastLabel.textColor = UIColor(hex: "#EC0000")
        toastLabel.font = font
        toastLabel.layer.borderColor = UIColor(hex: "#EC0000").cgColor
        toastLabel.layer.borderWidth = 1
        toastLabel.textAlignment = .center
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 12
        toastLabel.clipsToBounds = true
        self.view.addSubview(toastLabel)

        let safeAreaTopPadding = self.view.safeAreaInsets.top
        UIView.animate(withDuration: 0.5, delay: 0.2, options: .curveEaseOut, animations: {
            toastLabel.frame.origin.y = safeAreaTopPadding + 16
        }, completion: {(isCompleted) in
            UIView.animate(withDuration: 4.0, delay: 1.5, options: .curveEaseOut, animations: {
                toastLabel.alpha = 0.0
            }, completion: {(isCompleted) in
                toastLabel.removeFromSuperview()
            })
        })
    }
}
