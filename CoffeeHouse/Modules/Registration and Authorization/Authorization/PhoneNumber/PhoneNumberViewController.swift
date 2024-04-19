//
//  PhoneNumberViewController.swift
//  CoffeeHouse
//
//  Created by Erma on 16/4/24.
//

import UIKit

class PhoneNumberViewController: UIViewController {
    private let phoneNumberView = PhoneNumberView(frame: .zero)
    
    private let authService = AuthService()
    
    override func loadView() {
        super.loadView()
        view = phoneNumberView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        didNextTapped()
    }
    
    
    private func didNextTapped(){
        phoneNumberView.didNextBtnTapped = { [ weak self ] in
            guard let self else { return }
            sendSms()
        }
    }
    
    private func sendSms() {
        guard let text = phoneNumberView.phoneNumberTF.text else { return }
        authService.sendSmsCode(with: text) { result in
            switch result {
            case .success:
                let vc = PhoneNumberCodeViewController()
                let navController = UINavigationController(rootViewController: vc)
                DispatchQueue.main.async {
                                self.navigationController?.pushViewController(navController, animated: true)
                            }
                print("Success")
            case .failure(let error):
                print("Failed to send SMS: \(error.localizedDescription)")
            }
        }
    }
    
    
    
    
}
