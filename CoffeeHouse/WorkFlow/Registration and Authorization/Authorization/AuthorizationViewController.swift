//
//  AuthorizationViewController.swift
//  MyStoreProject
//
//  Created by Erma on 3/4/24.
//

import UIKit

class AuthorizationViewController: UIViewController {
    private let authorizationView = AuthorizationView(frame: .zero)

    private let authService = AuthService()
    
    override func loadView() {
        super.loadView()
        view = authorizationView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        didEntryTapped()
        sendSms()
    }
    
    
    private func didEntryTapped(){
        authorizationView.didEntryBtnTapped = { [ weak self ] in
            guard let self else { return }
//            let vc = MainViewController()
//            self.navigationController?.pushViewController(vc, animated: true)
            signIn()
        }
    }
    
    private func sendSms() {
        authService.sendSmsCode(with: "+996772776375") { result in
            if case.success = result {
                print("Success")
            }
        }
    }
    
    private func signIn() {
        guard let text = authorizationView.phoneNumberTF.text else { return }
        authService.signIn(with: text) { result in
            switch result {
            case .success(let success):
                print("Success")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }


}
