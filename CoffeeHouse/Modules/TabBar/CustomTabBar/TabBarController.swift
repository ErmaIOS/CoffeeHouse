//
//  TabBarController.swift
//  MyStoreProject
//
//  Created by Erma on 5/4/24.
//

import UIKit

class TabBarController: UITabBarController {

    private let customTabBar = CustomTabBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        confiigureTabs()
        setupNavigationItem()
        setValue(customTabBar, forKey: "tabBar")
    }
    
    private func setupNavigationItem() {
        navigationItem.title = "Меню"
        let rightBarButtonItem = UIBarButtonItem(image: UIImage(resource: .bellIcon), style: .plain, target: self, action: #selector(bellButtonTapped))
        
        rightBarButtonItem.tintColor = .black
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    private func confiigureTabs(){
        let vc1 = MainViewController()
        let vc2 = ShoppingCartViewController()
        let vc3 = NavigationViewController()
        let vc4 = UserProfileViewController()
        
        
        vc1.tabBarItem.image = UIImage(resource: .homeIcon)
        vc1.tabBarItem.selectedImage = UIImage(resource: .homeIcon).withTintColor(.orange).withRenderingMode(.alwaysOriginal)
        vc2.tabBarItem.image = UIImage(resource: .shoppingIcon)
        vc2.tabBarItem.selectedImage = UIImage(resource: .shoppingIcon).withTintColor(.orange).withRenderingMode(.alwaysOriginal)
        vc3.tabBarItem.image = UIImage(resource: .navIcon)
        vc3.tabBarItem.selectedImage = UIImage(resource: .navIcon).withTintColor(.orange).withRenderingMode(.alwaysOriginal)
        vc4.tabBarItem.image = UIImage(resource: .userIcon)
        vc4.tabBarItem.selectedImage = UIImage(resource: .userIcon).withTintColor(.orange).withRenderingMode(.alwaysOriginal)
    
        
        let nav1 = UINavigationController(rootViewController: vc1)
        let nav2 = UINavigationController(rootViewController: vc2)
        let nav3 = UINavigationController(rootViewController: vc3)
        let nav4 = UINavigationController(rootViewController: vc4)
       
        
        tabBar.backgroundColor = .white
        tabBar.tintColor = .black
        
        
        setViewControllers([nav1,nav2,nav3,nav4], animated: true)
    }
    
    
    
    
    
    @objc
    private func bellButtonTapped(){
    }
    

}
