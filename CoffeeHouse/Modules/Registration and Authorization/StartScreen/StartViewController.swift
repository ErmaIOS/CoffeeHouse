//
//  SplashViewController.swift
//  MyStoreProject
//
//  Created by Erma on 2/4/24.
//

import UIKit

class SplashViewController: UIViewController {
    private let splashView = SplashView(frame: .zero)
    
    
    
    override func loadView() {
        super.loadView()
        view = splashView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        didTappedBtn()
    }
    
    private func didTappedBtn(){
        splashView.didAuthorizationBtnTapped = {
            let vc = AuthorizationViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }

   

}
