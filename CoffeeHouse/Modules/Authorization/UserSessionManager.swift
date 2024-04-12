//
//  UserSessionManager.swift
//  MyStoreProject
//
//  Created by Erma on 31/3/24.
//

import UIKit


class UserSessionManager {
    static let shared = UserSessionManager()
    
     let name: String = "Ermek"
     let surname: String = "Tanikulov"
    private let phone: String = "+996772776375"
    private let sessionCreationDate: Date = Date()
    private var user: User?
    
    private init() {}
    
    
    
    
    
    
    func login(name: String, surname: String, completion: @escaping(Bool) -> Void){
        if name == "Ermek" && surname == "Tanikulov"{
            user = User(name: "Ermek", surname: "Tanikulov", phone: "+996772776385")
            completion(true)
           
        }else{
            self.user = nil
            completion(false)
           
        }
    }
    
}
