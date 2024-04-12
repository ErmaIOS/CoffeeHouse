//
//  AuthorizationViewController.swift
//  MyStoreProject
//
//  Created by Erma on 3/4/24.
//

import UIKit

class AuthorizationViewController: UIViewController {
    private let authorizationView = AuthorizationView(frame: .zero)

    
    override func loadView() {
        super.loadView()
        view = authorizationView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        didEntryTapped()
    }
    
    
    private func didEntryTapped(){
        authorizationView.didEntryBtnTapped = {
            let vc = MainViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }


}
