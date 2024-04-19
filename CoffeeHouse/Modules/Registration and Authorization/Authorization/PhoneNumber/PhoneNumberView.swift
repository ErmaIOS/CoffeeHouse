//
//  PhoneNumberView.swift
//  CoffeeHouse
//
//  Created by Erma on 16/4/24.
//

import UIKit

class PhoneNumberView: UIView{
    private let coffeeHouseIcon: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(resource: .coffeeHouseIcon)
        return view
    }()
    
    private let entryLabel: UILabel = {
        let view = UILabel()
        view.text = "Sign in"
        view.font = .systemFont(ofSize: 34)
        view.textColor = .black
        return view
    }()
   
    
    let phoneNumberTF: UITextField = {
        let view = UITextField()
        view.placeholder = "+996 555 555 555"
        view.textColor = .black
        view.backgroundColor = UIColor.init(hex: "#EDEDED")
        view.layer.cornerRadius = 25
        let leftContainerView = UIView(frame: CGRect(x: 0, y: 0, width: 56, height: 56))
        let iconImageView = UIImageView(image: UIImage(systemName: "phone"))
        iconImageView.tintColor = UIColor.systemGray2
        iconImageView.frame = CGRect(x: 16, y: 16, width: 24, height: 24)
        leftContainerView.addSubview(iconImageView)
        view.leftView = leftContainerView
        view.leftViewMode = .always
        return view
    }()
    
    private let loginLabel: UILabel = {
        let view = UILabel()
        view.text = "Or Login with"
        view.textAlignment = .center
        view.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return view
    }()
    private let separatorViewFirst: UIView = {
        let view =  UIView()
        view.backgroundColor = UIColor.gray
        return view
    }()
    private let separatorViewSecond: UIView = {
        let view =  UIView()
        view.backgroundColor = UIColor.gray
        return view
    }()
    
    private let googleBtn: UIButton = {
        let view = UIButton(type: .custom)
        view.setImage(UIImage(named: "googleIcon"), for: .normal)
        view.backgroundColor = .white
        view.addTarget(self, action: #selector(googleBtnTapped), for: .touchUpInside)
        return view
    }()
    
    private let nextBtn: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle("Next", for: .normal)
        view.setTitleColor(UIColor.white, for: .normal)
        view.backgroundColor = .orange
        view.layer.cornerRadius = 25
        view.addTarget(self, action: #selector(nextBtnTapped), for: .touchUpInside)
        return view
    }()
    
    private let dontHaveAccountLabel:UILabel = {
        let view = UILabel()
        view.text = "Don’t have an Account?"
        view.font = .systemFont(ofSize: 14)
        view.textColor = .black
        return view
    }()
    private let signUpBtn:UIButton = {
        let view = UIButton(type: .system)
        view.setTitle("Sign Up", for: .normal)
        view.setTitleColor(.orange, for: .normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        view.addTarget(self, action: #selector(signUpBtnTapped), for: .touchUpInside)
        return view
    }()
    var didNextBtnTapped: (() -> Void)?
    var didGoogleBtnTapped: (() -> Void)?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupConstraints(){
        backgroundColor = .white
        addSubview(coffeeHouseIcon)
        coffeeHouseIcon.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(155)
            make.horizontalEdges.equalToSuperview().inset(102)
            make.height.equalTo(80)
            make.width.equalTo(170)
        }
        
        addSubview(entryLabel)
        entryLabel.snp.makeConstraints { make in
            make.top.equalTo(coffeeHouseIcon.snp.bottom).offset(60)
            make.leading.equalToSuperview().offset(16)
        }
        
        
        addSubview(phoneNumberTF)
        phoneNumberTF.snp.makeConstraints { make in
            make.top.equalTo(entryLabel.snp.bottom).offset(32)
            make.horizontalEdges.equalToSuperview().inset(16)
            make.height.equalTo(56)
        }
        
        addSubview(nextBtn)
        nextBtn.snp.makeConstraints { make in
            make.top.equalTo(phoneNumberTF.snp.bottom).offset(30)
            make.horizontalEdges.equalToSuperview().inset(16)
            make.height.equalTo(56)
        }
        
        addSubview(separatorViewFirst)
        separatorViewFirst.snp.makeConstraints { make in
            make.top.equalTo(nextBtn.snp.bottom).offset(50)
            make.leading.equalToSuperview().offset(16)
            make.height.equalTo(1)
        }
        addSubview(loginLabel)
        loginLabel.snp.makeConstraints { make in
            make.centerY.equalTo(separatorViewFirst.snp.centerY)
            make.leading.equalTo(separatorViewFirst.snp.trailing).offset(8)
            make.centerX.equalToSuperview()
        }
        addSubview(separatorViewSecond)
        separatorViewSecond.snp.makeConstraints { make in
            make.centerY.equalTo(separatorViewFirst.snp.centerY)
            make.leading.equalTo(loginLabel.snp.trailing).offset(8)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(1)
        }
        
        addSubview(googleBtn)
        googleBtn.snp.makeConstraints { make in
            make.top.equalTo(loginLabel.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.width.equalTo(40)
            make.height.equalTo(40)
        }
        
        addSubview(dontHaveAccountLabel)
        dontHaveAccountLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-40)
            make.leading.equalToSuperview().offset(16)
            make.height.equalTo(16)
        }
        addSubview(signUpBtn)
        signUpBtn.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-40)
            make.leading.equalTo(dontHaveAccountLabel.snp.trailing).offset(4)
            make.height.equalTo(16)
        }
        
    }
    
    @objc
    private func nextBtnTapped(){
        didNextBtnTapped?()
    }
    @objc
    private func googleBtnTapped(){
       didGoogleBtnTapped?()
    }
    @objc
    private func signUpBtnTapped(){
        
    }
}
