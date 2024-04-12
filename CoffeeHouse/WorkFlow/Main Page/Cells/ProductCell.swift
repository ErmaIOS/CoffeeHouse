//
//  coffeeProductCell.swift
//  MyStoreProject
//
//  Created by Erma on 4/4/24.
//

import UIKit

class ProductCell: UICollectionViewCell {
    static let reuseId = "product_cell"
    
    private let ImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(resource: .brauniIcon)
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 24
        return view
    }()
    
    private let nameLabel: UILabel = {
        let view = UILabel()
        view.text = "Капучино"
        view.font = .systemFont(ofSize: 16)
        view.textColor = .black
        return view
    }()
    
    private let descriptionLabel: UILabel = {
        let view = UILabel()
        view.text = "Кофейный напиток"
        view.font = .systemFont(ofSize: 12)
        view.textColor = .black
        return view
    }()
    
    private let priceLabel: UILabel = {
        let view = UILabel()
        view.text = "140 c"
        view.font = .systemFont(ofSize: 14)
        view.textColor = UIColor.init(hex: "#FF8B5B")
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupConstraints(){
        contentView.addSubview(ImageView)
        ImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.height.width.equalTo(89)
        }
        
        contentView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.leading.equalTo(ImageView.snp.trailing).offset(16)
        }
        
        contentView.addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(8)
            make.leading.equalTo(ImageView.snp.trailing).offset(16)
        }
        
        contentView.addSubview(priceLabel)
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(8)
            make.leading.equalTo(ImageView.snp.trailing).offset(16)
        }
    }
    
    
    func setLabel(_ image: String,_ name: String,_ description: String,_ price: String){
        ImageView.image = UIImage(named: image)
        nameLabel.text = name
        descriptionLabel.text = description
        priceLabel.text = price
    }
    
    func fill(with model: ProductModel){
        ImageView.image = UIImage(named: model.productImage)
        nameLabel.text = model.productName
        descriptionLabel.text = model.productDescription
        priceLabel.text = model.productPrice
    }
    
}
