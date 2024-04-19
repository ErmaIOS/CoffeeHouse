//
//  SplashViewController.swift
//  MyStoreProject
//
//  Created by Erma on 2/4/24.
//

import UIKit

class StartViewController: UIViewController {
    private let splashView = StartView(frame: .zero)
    
    
    
    override func loadView() {
        super.loadView()
        view = splashView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        didTappedBtn()
        navigationItem.hidesBackButton = true
    }
    
    private func didTappedBtn(){
        splashView.didAuthorizationBtnTapped = {
            let vc = PhoneNumberViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }

   

}
