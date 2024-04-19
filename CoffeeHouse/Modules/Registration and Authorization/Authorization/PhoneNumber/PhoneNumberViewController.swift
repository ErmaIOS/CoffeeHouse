//
//  PhoneNumberViewController.swift
//  CoffeeHouse
//
//  Created by Erma on 16/4/24.
//

import UIKit

class PhoneNumberViewController: UIViewController {
    private let phoneNumberView = PhoneNumberView(frame: .zero)
    
    private let authService = AuthService.shared
    
    override func loadView() {
        super.loadView()
        view = phoneNumberView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        didNextTapped()
        didGoogleBtnTapped()
    }
    
    
    private func didNextTapped(){
        phoneNumberView.didNextBtnTapped = { [ weak self ] in
            guard let self else { return }
            sendSms()
        }
    }
    
    private func didGoogleBtnTapped(){
        phoneNumberView.didGoogleBtnTapped = { [weak self] in
            guard let self = self else { return }
            let vc = EmailViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
    
    private func sendSms() {
        guard let text = phoneNumberView.phoneNumberTF.text else { return }
        authService.sendSmsCode(with: text) { result in
            DispatchQueue.main.async {
                switch result {
                case .success:
                    let vc = PhoneNumberCodeViewController()
                    self.navigationController?.pushViewController(vc, animated: true)
                case .failure(let error):
                    print("Failed to send SMS: \(error.localizedDescription)")
                }
            }
        }
    }
    
    
}
