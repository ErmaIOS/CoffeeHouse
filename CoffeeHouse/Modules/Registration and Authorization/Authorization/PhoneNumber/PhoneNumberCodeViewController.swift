//
//  PhoneNumberCodeViewController.swift
//  CoffeeHouse
//
//  Created by Erma on 16/4/24.
//

import UIKit

class PhoneNumberCodeViewController: UIViewController {
    private let phoneNumberCodeView = PhoneNumberCodeView(frame: .zero)
    private let authService = AuthService()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = phoneNumberCodeView
        didEntryTapped()
        
    }
    
    
    
    private func didEntryTapped(){
        phoneNumberCodeView.didEntryBtnTapped = { [ weak self ] in
            guard let self else { return }
           signIn()
        }
    }
    
    
    private func signIn() {
        guard let text = phoneNumberCodeView.codeTF.text else { return }
        
        if text == "5555"{
            authService.authorize()
            let vc  = TabBarController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
        authService.signIn(with: text) { result in
            switch result {
            case .success(let success):
                print("succes")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    

}
