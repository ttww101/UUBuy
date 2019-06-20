//
//  MeViewController.swift
//  UUBuy
//
//  Created by Jack on 2019/6/13.
//  Copyright © 2019 com.timi.test.test. All rights reserved.
//

import UIKit
import SnapKit
import SVProgressHUD

class MeViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nameLabel.text = UserModel.shared.isLogin() ? "登入用戶" : "遊客"
    }
    
    let nameLabel = UILabel()
    let emailLabel = UILabel()
    let logoutBtn = UIButton()
    let meTableView = MeTableView(frame: CGRect(x: 15, y: 160, width: width-30, height: height - 300), style: .plain)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = grayColor
        let navImageView = UIImageView(image: getGradientImage(width: width, height: 100))
        navImageView.frame = CGRect(x: 0, y: -0, width: width, height: 175)
        view.addSubview(navImageView)
        
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        navigationItem.title = "个人"
        
        let avatarImgView = UIImageView(named: "avatar")
        view.addSubview(avatarImgView)
        
        avatarImgView.snp.makeConstraints { (make) in
            
            make.top.equalTo(view.snp.topMargin).offset(10)
            make.left.equalTo(view).offset(10)
            make.width.height.equalTo(70)
        }
        avatarImgView.layer.borderColor = UIColor.white.cgColor
        avatarImgView.layer.borderWidth = 2
        avatarImgView.layer.cornerRadius = 35
        avatarImgView.clipsToBounds = true
        
        nameLabel.text = UserModel.shared.isLogin() ? "登入用戶" : "遊客"
        nameLabel.font = UIFont.systemFont(ofSize: 18)
        nameLabel.textColor = .white
        view.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(view.snp.topMargin).offset(25)
            make.left.equalTo(avatarImgView.snp.right).offset(10)
            make.right.equalTo(view)
        }
        
        
        emailLabel.text = UserModel.shared.email
        emailLabel.font = UIFont.systemFont(ofSize: 18)
        emailLabel.textColor = .white
        view.addSubview(emailLabel)
        emailLabel.snp.makeConstraints { (make) in
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
            make.left.equalTo(nameLabel)
            make.right.equalTo(view)
        }
        
        
        meTableView.layer.cornerRadius = 10
        meTableView.clipsToBounds = true
        meTableView.nav = navigationController
        view.addSubview(meTableView)
        
        logoutBtn.setTitle("退出登入", for: .normal)
        logoutBtn.setTitleColor(.black, for: .normal)
        logoutBtn.backgroundColor = .white
        logoutBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        logoutBtn.layer.cornerRadius = 5
        logoutBtn.clipsToBounds = true
        view.addSubview(logoutBtn)
        logoutBtn.snp.makeConstraints { (make) in
            make.left.right.equalTo(meTableView)
            make.top.equalTo(meTableView.snp.bottom).offset(10)
            make.height.equalTo(45)
        }
        logoutBtn.layer.masksToBounds = false
        logoutBtn.layer.shadowColor = UIColor.gray.cgColor
        logoutBtn.layer.shadowOffset = CGSize(width: 1, height: 1)
        logoutBtn.layer.shadowRadius = 2
        logoutBtn.layer.shadowOpacity = 0.2
        logoutBtn.rx.tap.subscribe(onNext: {
            if UserModel.shared.isLogin() {
                let controller = UIAlertController(title: "確認登出", message: "是否要登出", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "好的", style: .default) { (_) in
                    UserModel.shared.logout()
                    SVProgressHUD.showInfo(withStatus: "登出成功")
                    self.nameLabel.text = UserModel.shared.isLogin() ? "登入用戶" : "遊客"
                    self.emailLabel.text = UserModel.shared.email
                }
                controller.addAction(okAction)
                let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
                controller.addAction(cancelAction)
                self.present(controller, animated: true, completion: nil)
            }
        })
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
