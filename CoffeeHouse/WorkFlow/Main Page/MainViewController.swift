//
//  MainPageViewController.swift
//  MyStoreProject
//
//  Created by Erma on 3/4/24.
//

import UIKit
import SnapKit


class MainViewController: UIViewController {
    
    private let horizontalCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = .init(width: 0, height: 0)
       
        layout.minimumInteritemSpacing = 15
        layout.sectionInset = .init(top: 0, left: 16, bottom: 0, right: 0)
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        return cv
    }()
    
    
    private let coffeeLabel: UILabel = {
        let view = UILabel()
        view.text = "Кофе"
        view.font = .systemFont(ofSize: 24)
        view.textColor = .black
        return view
    }()
    
    private let verticalCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = .init(width: UIScreen.main.bounds.width - 32, height: 89)
        layout.minimumLineSpacing = 18
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = .init(top: 0, left: 0, bottom: 0, right: 0)
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.layer.cornerRadius = 24
        return cv
    }()

    private var selectedCategoryIndex = 0
    
    private let category = [ CategoryTitle(title: "Кофе"),CategoryTitle(title: "Десерты"),CategoryTitle(title: "Выпечка"),CategoryTitle(title: "Коктейли"),CategoryTitle(title: "Чай")]
    
    private let products: [Int: [Model]] = [
        0: [
            Model(image: "cappuccinoIcon", title: "Капучино", description: "Кофейный напиток", price: "140 с"),
            Model(image: "latteIcon", title: "Латте", description: "Кофейный напиток", price: "140 с"),
            Model(image: "americanoIcon", title: "Американо", description: "Кофейный напиток", price: "100 с"),
            Model(image: "rafIcon", title: "Раф", description: "Кофейный напиток", price: "170 с"),
            Model(image: "expressoIcon", title: "Экспрессо", description: "Кофейный напиток", price: "100 с"),
            Model(image: "mokkoIcon", title: "Мокко", description: "Кофейный напиток", price: "160 с")
        ],
        1: [
            Model(image: "cappuccinoIcon", title: "Чизкейк", description: "Сладенькое дополнение", price: "140 с"),
            Model(image: "latteIcon", title: "Брауни", description: "Сладенькое дополнение", price: "250 с"),
            Model(image: "americanoIcon", title: "Маффин", description: "Сладенькое дополнение", price: "120 с"),
            Model(image: "rafIcon", title: "Тирамису", description: "Сладенькое дополнение", price: "260 с"),
            
        ],
        2: [
            Model(image: "cappuccinoIcon", title: "Краусан", description: "Кофейный напиток", price: "150 с"),
            Model(image: "latteIcon", title: "Булочка с корицей", description: "Кофейный напиток", price: "120 с"),
            Model(image: "americanoIcon", title: "Шарлотка с яблоком", description: "Кофейный напиток", price: "120 с"),
            Model(image: "rafIcon", title: "Сырные крекеры", description: "Кофейный напиток", price: "150 с")
        ],
        3: [
            Model(image: "cappuccinoIcon", title: "Багровый закат", description: "Кофейный напиток", price: "250 с"),
            Model(image: "latteIcon", title: "Радуга", description: "Кофейный напиток", price: "230 с"),
            Model(image: "americanoIcon", title: "Мохито", description: "Кофейный напиток", price: "250 с"),
            Model(image: "rafIcon", title: "Мохито Клубничный", description: "Кофейный напиток", price: "270 с"),
            Model(image: "expressoIcon", title: "Пина Колада", description: "Кофейный напиток", price: "350 с")
        ],
        4: [
            Model(image: "cappuccinoIcon", title: "Черный чай", description: "Кофейный напиток", price: "140 с"),
            Model(image: "latteIcon", title: "Зеленый чай", description: "Кофейный напиток", price: "140 с"),
            Model(image: "americanoIcon", title: "Фруктовый чай", description: "Кофейный напиток", price: "200 с"),
            Model(image: "rafIcon", title: "Чай с имбирем", description: "Кофейный напиток", price: "160 с"),
            Model(image: "expressoIcon", title: "Чай с лимоном", description: "Кофейный напиток", price: "150 с"),
            Model(image: "mokkoIcon", title: "Компот", description: "Кофейный напиток", price: "100 с")
        ]
    ]
    
  
    
    
    
    
    // private var products: [ProductModel] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavigationItem()
        setupCollectionView()
        setupConstraints()
        //fetchProducts()
        selectDefaultCoffeeCategory()
            }
    
    private func setupCollectionView() {
        horizontalCollectionView.dataSource = self
        horizontalCollectionView.delegate = self
        horizontalCollectionView.showsHorizontalScrollIndicator = false
        horizontalCollectionView.register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.reuseId)
        
        verticalCollectionView.dataSource = self
        verticalCollectionView.delegate = self
        verticalCollectionView.showsVerticalScrollIndicator = false
        verticalCollectionView.register(ProductCell.self, forCellWithReuseIdentifier: ProductCell.reuseId)
    }
    
    private func setupConstraints(){
        view.addSubview(horizontalCollectionView)
        horizontalCollectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.height.equalTo(32)
            make.horizontalEdges.equalToSuperview()
        }
        
        view.addSubview(coffeeLabel)
        coffeeLabel.snp.makeConstraints { make in
            make.top.equalTo(horizontalCollectionView.snp.bottom).offset(24)
            make.leading.equalToSuperview().offset(16)
        }
        
        view.addSubview(verticalCollectionView)
        verticalCollectionView.snp.makeConstraints { make in
            make.top.equalTo(coffeeLabel.snp.bottom).offset(16)
            make.horizontalEdges.equalToSuperview().inset(16)
            make.bottom.equalToSuperview()
        }
    }
    
    
    
    //    private func fetchProducts(){
    //        let parser = JSONParser()
    //        if let url = Bundle.main.url(forResource: "Product", withExtension: "json"),
    //           let data = try? Data(contentsOf: url){
    //
    //            parser.decode(with: data){ [weak self] (result: Result<[ProductModel],Error>) in
    //                guard let self else { return }
    //                switch result{
    //                case .success(let products):
    //                    self.products = products
    //                    self.verticalCollectionView.reloadData()
    //                case .failure(let error):
    //                    print(error)
    //                }
    //            }
    //        }
    //    }
    
    
    private func selectDefaultCoffeeCategory() {
        if let coffeeIndex = category.firstIndex(where: { $0.title == "Кофе" }) {
            let coffeeIndexPath = IndexPath(item: coffeeIndex, section: 0)
            horizontalCollectionView.selectItem(at: coffeeIndexPath, animated: false, scrollPosition: .left)
            if let cell = horizontalCollectionView.cellForItem(at: coffeeIndexPath) as? CategoryCell {
                cell.blueView.backgroundColor = .blue
            }
        }
    }
    
    private func setupNavigationItem() {
        navigationItem.title = "Меню"
        let rightBarButtonItem = UIBarButtonItem(image: UIImage(resource: .bellIcon), style: .plain, target: self, action: #selector(bellButtonTapped))
        
        rightBarButtonItem.tintColor = .black
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    
    @objc
    private func bellButtonTapped(){
    }
    
    
}


extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == horizontalCollectionView {
    
                    selectedCategoryIndex = indexPath.row
                    verticalCollectionView.reloadData()
                    coffeeLabel.text = category[selectedCategoryIndex].title

                    if let cell = collectionView.cellForItem(at: indexPath) as? CategoryCell {
                        cell.blueView.backgroundColor = UIColor(hex: "#283952")
                        cell.tabsLabel.textColor = .white
                    }
                } else if collectionView == verticalCollectionView {
                    let vc = DescriptionViewController()
                    guard let product = products[selectedCategoryIndex]?[indexPath.item] else {
                        return
                    }
                    vc.modelData = product
                    navigationController?.pushViewController(vc, animated: true)
                }
            

        
       
               
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? CategoryCell else {
            return
        }
        cell.blueView.backgroundColor = .white
        cell.tabsLabel.textColor = UIColor.init(hex: "#C2C1C3")
    }
    
    
}


extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == horizontalCollectionView {
            return category.count
        } else if collectionView == verticalCollectionView {
         
            if let productsForCategory = products[selectedCategoryIndex] {
                return productsForCategory.count
            } else {
                return 0
            }
        } else {
            return 0
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == horizontalCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.reuseId,
                                                          for: indexPath) as? CategoryCell
            cell?.setLabel(category[indexPath.row].title)
            return cell ?? CategoryCell()
        } else if collectionView == verticalCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCell.reuseId,
                                                          for: indexPath) as? ProductCell
            
            guard let product = products[selectedCategoryIndex]?[indexPath.row] else { fatalError() }
            cell?.setLabel(product.image, product.title, product.description, product.price)
                       
            
            //                let model = products[indexPath.row]
            //                cell?.fill(with: model)
            
            return cell ?? ProductCell()
        } else {
            return UICollectionViewCell()
        }
        
        
    }
}



extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == horizontalCollectionView {
            switch indexPath.row {
            case 0:
                return CGSize(width: 72, height: 32)
            case 1:
                return CGSize(width: 98, height: 32)
            case 2:
                return CGSize(width: 101, height: 32)
            case 3:
                return CGSize(width: 106, height: 32)
            case 4:
                return CGSize(width: 70, height: 32)
            default:
                return CGSize(width: 72, height: 32)
            }
        } else {
            return CGSize(width: UIScreen.main.bounds.width - 32, height: 89)
        }
    }
}




