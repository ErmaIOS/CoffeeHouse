//
//  UserAuthorizationView.swift
//  MyStoreProject
//
//  Created by Erma on 31/3/24.
//

import UIKit
import SnapKit



class UserAuthorizationView: UIView {
    
    private let welcomeLabel: UILabel = {
        let view = UILabel()
        view.text = "Welcome Back"
        view.textColor = UIColor.black
        view.font = .systemFont(ofSize: 24, weight: .bold)
        return view
    }()
    
      let nameTF: UITextField = {
        let view = UITextField()
        view.placeholder = "Name"
        view.textColor = UIColor.black
        view.font = .systemFont(ofSize: 14)
        view.layer.cornerRadius = 16
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.lightGray.cgColor
        let leftiew = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        view.leftView = leftiew
        view.leftViewMode = .always
        view.addTarget(self, action: #selector(validateFieldsChange), for: .editingChanged)
        return view
    }()
    
    let surnameTF: UITextField = {
        let view = UITextField()
        view.placeholder = "Surname"
        view.textColor = UIColor.black
        view.layer.cornerRadius = 16
        view.font = .systemFont(ofSize: 14)
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.lightGray.cgColor
        let leftiew = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        view.leftView = leftiew
        view.leftViewMode = .always
        view.addTarget(self, action: #selector(validateFieldsChange), for: .editingChanged)
        return view
    }()
    
     let loginBtn: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle("Login", for: .normal)
        view.setTitleColor(UIColor.white, for: .normal)
        view.backgroundColor = UIColor.darkGray
        view.layer.cornerRadius = 16
        view.addTarget(self, action: #selector(loginBtnTapped), for: .touchUpInside)
        return view
    }()
    
    
    var didLoginBtnTapped: (() -> Void)?
    var didValidateFieldsChange: (() -> Void)?
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            backgroundColor = .systemBackground
            setupConstraints()
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    private func setupConstraints(){
      addSubview(welcomeLabel)
        welcomeLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(50)
            make.centerX.equalToSuperview()
        }
        addSubview(nameTF)
        nameTF.snp.makeConstraints { make in
            make.top.equalTo(welcomeLabel.snp.bottom).offset(30)
            make.horizontalEdges.equalToSuperview().inset(16)
            make.height.equalTo(50)
        }
        addSubview(surnameTF)
        surnameTF.snp.makeConstraints { make in
            make.top.equalTo(nameTF.snp.bottom).offset(30)
            make.horizontalEdges.equalToSuperview().inset(16)
            make.height.equalTo(50)
        }
        addSubview(loginBtn)
        loginBtn.snp.makeConstraints { make in
            make.top.equalTo(surnameTF.snp.bottom).offset(30)
            make.horizontalEdges.equalToSuperview().inset(16)
            make.height.equalTo(50)
        }
    }
    
    @objc
    private func loginBtnTapped(){
       didLoginBtnTapped?()
    }
    
    @objc
    private func validateFieldsChange(){
        didValidateFieldsChange?()
    }

    

}
