//
//  LoginView.swift
//  UUBuy
//
//  Created by Jack on 2019/6/18.
//  Copyright © 2019 com.timi.test.test. All rights reserved.
//

import UIKit

class LoginView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.borderWidth = 2
        layer.borderColor = orangeColor?.cgColor
        layer.cornerRadius = 10
        clipsToBounds = true
        
        let userNameTextField = LoginTextField()
        userNameTextField.placeholder = "请输入用户邮箱"
        addSubview(userNameTextField)
        userNameTextField.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.top.equalTo(self).offset(30)
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
        
        let userNameIconView = UIImageView(named: "buy_mbmail")
        addSubview(userNameIconView)
        userNameIconView.snp.makeConstraints { (make) in
            make.centerY.equalTo(userNameIconView)
            make.left.equalTo(userNameIconView).offset(5)
            make.size.equalTo(CGSize(width: 20, height: 20))
        }
        
        let passwordTextField = LoginTextField()
        passwordTextField.placeholder = "请输入密码"
        addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.top.equalTo(userNameTextField.snp.bottom).offset(10)
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
        
        
        let passwordIconView = UIImageView(named: "buy_mblock")
        addSubview(passwordIconView)
        passwordIconView.snp.makeConstraints { (make) in
            make.centerY.equalTo(passwordTextField)
            make.left.equalTo(passwordTextField).offset(5)
            make.size.equalTo(CGSize(width: 20, height: 20))
        }
        
        let forgetPasswordBtn = UIButton()
        forgetPasswordBtn.setTitle("忘记密码", for: .normal)
        forgetPasswordBtn.setTitleColor(.gray, for: .normal)
        addSubview(forgetPasswordBtn)
        forgetPasswordBtn.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.top.equalTo(passwordTextField.snp.bottom).offset(5)
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
        
        let loginBtn = UIButton()
        loginBtn.setTitle("登入", for: .normal)
        loginBtn.setTitleColor(.white, for: .normal)
        loginBtn.backgroundColor = orangeColor
        loginBtn.layer.cornerRadius = 10
        loginBtn.clipsToBounds = true
        addSubview(loginBtn)
        loginBtn.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.bottom.equalTo(self).offset(-30)
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class LoginTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = grayColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 35, dy: 0)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 35, dy: 0)
    }
}
