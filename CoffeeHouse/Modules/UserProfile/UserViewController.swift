//
//  UserProfileViewController.swift
//  MyStoreProject
//
//  Created by Erma on 2/4/24.
//

import UIKit

class UserViewController: UIViewController{
    private let userProfileView = UserProfileView(frame: .zero)
    
    var user: User?
    
    override func loadView() {
        super.loadView()
        view = userProfileView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    
    func upadateLabels(){
        guard let user = user else { return }
        userProfileView.updateLabels(with: user)
    }
}
