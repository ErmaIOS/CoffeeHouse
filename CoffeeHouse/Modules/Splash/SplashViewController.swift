//
//  SplashViewController.swift
//  CoffeeHouse
//
//  Created by Erma on 16/4/24.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let currentTime = Date()
        if let sessionDate = UserDefaults.standard.object(
            forKey: "session"
        ) as? Date,sessionDate >= currentTime {
            showTabBar()
        }else{
            showPhoneNumber()
        }
        
        
    }
    

    private func showPhoneNumber(){
        let phoneViewController = PhoneNumberViewController()
        navigationController?.pushViewController(phoneViewController, animated: true)
    }
    

    
    
    private func showTabBar(){
        let tabBarController = TabBarController()
        navigationController?.pushViewController(tabBarController, animated: true)
    }

}
