//
//  PhoneNumberCodeView.swift
//  CoffeeHouse
//
//  Created by Erma on 16/4/24.
//

import UIKit
import SnapKit

class PhoneNumberCodeView: UIView {

    
    let codeTF: UITextField = {
        let view = UITextField()
        view.placeholder = "Code"
        view.textColor = .black
        view.backgroundColor = UIColor.systemGray3
        view.layer.cornerRadius = 25
        let leftContainerView = UIView(frame: CGRect(x: 0, y: 0, width: 56, height: 56))
        view.leftView = leftContainerView
        view.leftViewMode = .always
        return view
    }()
    private let entryBtn: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle("Войти", for: .normal)
        view.setTitleColor(UIColor.white, for: .normal)
        view.backgroundColor = .orange
        view.layer.cornerRadius = 25
        view.addTarget(self, action: #selector(entryBtnTapped), for: .touchUpInside)
        return view
    }()
    
    var didEntryBtnTapped: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupConstraints()
    }
    
    private func setupConstraints(){
        addSubview(codeTF)
        
        codeTF.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(50)
            make.horizontalEdges.equalToSuperview().inset(16)
            make.height.equalTo(50)
        }
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

   @objc
    private func entryBtnTapped(){
        didEntryBtnTapped?()
    }
}
