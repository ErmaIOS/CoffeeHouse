//
//  QRCodeButton.swift
//  CoffeeHouse
//
//  Created by Erma on 12/4/24.
//

import UIKit

final class QRCodeButton: UIButton {
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.width / 2
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupMiddleButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupMiddleButton(){
        if let originalImage = UIImage(systemName: "qrcode.viewfinder") {
            let resizedImage = originalImage.withConfiguration(UIImage.SymbolConfiguration(pointSize: 25))
            setImage(resizedImage, for: .normal)
        }
        tintColor = .white
        backgroundColor = .orange
        layer.cornerRadius = 30
        layer.masksToBounds = true
        
    }
}
