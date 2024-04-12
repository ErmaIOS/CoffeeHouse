//
//  ViewController.swift
//  MyStoreProject
//
//  Created by Erma on 31/3/24.
//

import UIKit

class UserAuthorizationViewController: UIViewController {
    private let userAuthorizationView = UserAuthorizationView(frame: .zero)
    private let sessionManager =  UserSessionManager.shared
    
    
    override func loadView() {
        super.loadView()
        view = userAuthorizationView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        didLoginBtnTapped()
        didValidateFieldsChange()
    }
    
    
    
    
    
    private func didLoginBtnTapped(){
        userAuthorizationView.didLoginBtnTapped = {
            let name = self.userAuthorizationView.nameTF.text ?? ""
            let surname = self.userAuthorizationView.surnameTF.text ?? ""
            self.sessionManager.login(name: name, surname: surname) { success in
                if success {
                    let vc = UserViewController()
                    self.navigationController?.pushViewController(vc, animated: true)
                } else {
                    let alert = UIAlertController(title: "ERROR",
                                                              message: "Incorrect name or surname!",
                                                              preferredStyle: .alert)
                    let acceptAction = UIAlertAction(title: "OK", style: .cancel)
                    alert.addAction(acceptAction)
                    self.present(alert, animated: true)
                    
                }
                
            }
        }
    }
    
    private func didValidateFieldsChange(){
        userAuthorizationView.didValidateFieldsChange = {
            let name = self.userAuthorizationView.nameTF.text ?? ""
            let surname = self.userAuthorizationView.surnameTF.text ?? ""
            let loginBtn = self.userAuthorizationView.loginBtn
            
            if name != "" && surname != "" && name.count >= 5 && surname.count >= 6 {
                loginBtn.backgroundColor = .blue
            }else{
                loginBtn.backgroundColor = .darkGray
            }
        }
        
    }
    
    
    
    
    
}




