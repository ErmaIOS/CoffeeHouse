//
//  UserProfileView.swift
//  MyStoreProject
//
//  Created by Erma on 2/4/24.
//

import UIKit
import SnapKit

class UserProfileView: UIView{
    
    private let nameLabel: UILabel = {
        let view = UILabel()
        view.text = "Ermek"
        view.font = .systemFont(ofSize: 16)
        view.textColor = .black
        return view
    }()
    
    
    private let surnameLabel: UILabel = {
        let view = UILabel()
        view.text = "Tanikulov"
        view.font = .systemFont(ofSize: 16)
        view.textColor = .black
        return view
    }()
    
    
    private let phoneLabel: UILabel = {
        let view = UILabel()
        view.text = "+996772776375"
        view.font = .systemFont(ofSize: 16)
        view.textColor = .black
        return view
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints(){
        addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(200)
            make.centerX.equalToSuperview()
        }
        addSubview(surnameLabel)
        surnameLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
        }
        addSubview(phoneLabel)
        phoneLabel.snp.makeConstraints { make in
            make.top.equalTo(surnameLabel.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
        }
        
    }
    
    func updateLabels(with: User) {
            nameLabel.text = with.name
            surnameLabel.text = with.surname
            phoneLabel.text = with.phone
        }
}
