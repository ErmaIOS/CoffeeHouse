//
//  SplashView.swift
//  MyStoreProject
//
//  Created by Erma on 2/4/24.
//

import UIKit

class StartView: UIView {
    private let coffeeHouseIcon: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(resource: .coffeeHouseIcon)
        return view
    }()
    
    private let authorizationBtn: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle("Sign In", for: .normal)
        view.setTitleColor(UIColor.white, for: .normal)
        view.backgroundColor = .orange
        view.layer.cornerRadius = 25
        view.addTarget(self, action: #selector(authorizationBtnTapped), for: .touchUpInside)
        return view
    }()
    
    private let regisrationBtn: UIButton = {
        let view = UIButton(type: .system)
        view.setTitleColor(UIColor.systemGray3, for: .normal)
        view.setTitle("Sign Up", for: .normal)
        view.backgroundColor = .white
        view.layer.cornerRadius = 25
        return view
    }()
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            setupConstraints()
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var didAuthorizationBtnTapped: (() -> Void)?
    
    private func setupConstraints(){
        backgroundColor = .white
        addSubview(coffeeHouseIcon)
        coffeeHouseIcon.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(234)
            make.horizontalEdges.equalToSuperview().inset(102)
            make.width.equalTo(170)
            make.height.equalTo(80)
        }
        
        addSubview(authorizationBtn)
        authorizationBtn.snp.makeConstraints { make in
            make.top.equalTo(coffeeHouseIcon.snp.bottom).offset(98)
            make.horizontalEdges.equalToSuperview().inset(16)
            make.height.equalTo(56)
        }
        
        addSubview(regisrationBtn)
        regisrationBtn.snp.makeConstraints { make in
            make.top.equalTo(authorizationBtn.snp.bottom).offset(16)
            make.horizontalEdges.equalToSuperview().inset(16)
            make.height.equalTo(56)
        }
    }
    
    @objc
    private func authorizationBtnTapped(){
        didAuthorizationBtnTapped?()
    }
}
