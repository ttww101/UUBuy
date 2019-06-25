//
//  UserModel.swift
//  UUBuy
//
//  Created by Jack on 2019/6/12.
//  Copyright © 2019 com.timi.test.test. All rights reserved.
//

import Foundation

class UserModel: NSObject, Codable {
    static var shared = UserModel()
    static var allUser: [UserModel] = []
    var email = ""
    var password = ""
    var address = ""
    
    func login(email: String, password: String) -> Bool {
        for user in UserModel.allUser {
            if email == user.email && password == user.password {
                self.email = user.email
                self.password = user.password
                address = user.address
                return true
            }
        }
        return false
    }
    
    func logout() {
        email = ""
        password = ""
        address = ""
    }
    
    func register(email: String, password: String, address: String) -> Bool {
        for user in UserModel.allUser {
            if email == user.email  {
                return false
            }
        }
        self.email = email
        self.password = password
        self.address = address
        UserModel.allUser.append(self)
        return true
    }
    
    func isLogin() -> Bool {
        return email != ""
    }
}
