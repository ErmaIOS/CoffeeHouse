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
        view.text = "Вход"
        view.font = .systemFont(ofSize: 34)
        view.textColor = .black
        return view
    }()
    
    let phoneNumberTF: UITextField = {
        let view = UITextField()
        view.placeholder = "+996 555 555 555"
        view.textColor = .black
        view.backgroundColor = UIColor.systemGray3
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
    
    private let nextBtn: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle("Next", for: .normal)
        view.setTitleColor(UIColor.white, for: .normal)
        view.backgroundColor = .orange
        view.layer.cornerRadius = 25
        view.addTarget(self, action: #selector(nextBtnTapped), for: .touchUpInside)
        return view
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var didNextBtnTapped: (() -> Void)?
    
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
            make.top.equalTo(phoneNumberTF.snp.bottom).offset(20)
            make.horizontalEdges.equalToSuperview().inset(16)
            make.height.equalTo(56)
        }
    }
    
    @objc
    private func nextBtnTapped(){
       didNextBtnTapped?()
    }
}
