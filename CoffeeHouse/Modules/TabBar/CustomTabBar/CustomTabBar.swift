//
//  CustomTabBar.swift
//  CoffeeHouse
//
//  Created by Erma on 12/4/24.
//

import UIKit
import SnapKit

final class CustomTabBar: UITabBar {
    
    private let qrCodeButton = QRCodeButton(type: .system)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupQrButton()
        backgroundColor = .systemBackground
//        itemPositioning = .fill
//        itemWidth = 50
//        itemSpacing = 50
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        qrCodeButton.frame.contains(point) ? qrCodeButton : super.hitTest(point, with: event)
    }
    
    private func setupQrButton(){
        addSubview(qrCodeButton)
        qrCodeButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.width.equalTo(60)
            make.bottom.equalToSuperview().offset(-50)
        }
    }
   
    
        
    
}


    

