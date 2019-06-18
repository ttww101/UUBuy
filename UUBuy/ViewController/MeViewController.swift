//
//  MeViewController.swift
//  UUBuy
//
//  Created by Jack on 2019/6/13.
//  Copyright © 2019 com.timi.test.test. All rights reserved.
//

import UIKit
import SnapKit

class MeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = grayColor
        let navImageView = UIImageView(image: getGradientImage(width: width, height: 100))
        navImageView.frame = CGRect(x: 0, y: -0, width: width, height: 175)
        view.addSubview(navImageView)
        
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
        
        let nameLabel = UILabel()
        nameLabel.text = "小包子"
        nameLabel.font = UIFont.systemFont(ofSize: 18)
        nameLabel.textColor = .white
        view.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(view.snp.topMargin).offset(25)
            make.left.equalTo(avatarImgView.snp.right).offset(10)
            make.right.equalTo(view)
        }
        
        let emailLabel = UILabel()
        emailLabel.text = "1xxxxxx@xx.com"
        emailLabel.font = UIFont.systemFont(ofSize: 18)
        emailLabel.textColor = .white
        view.addSubview(emailLabel)
        emailLabel.snp.makeConstraints { (make) in
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
            make.left.equalTo(nameLabel)
            make.right.equalTo(view)
        }
        
        let meTableView = MeTableView(frame: CGRect(x: 15, y: 160, width: width-30, height: height - 300), style: .plain)
        meTableView.layer.cornerRadius = 10
        meTableView.clipsToBounds = true
        meTableView.nav = navigationController
        view.addSubview(meTableView)
        
        let logoutBtn = UIButton()
        logoutBtn.setTitle("退出登入", for: .normal)
        logoutBtn.backgroundColor = .white
        logoutBtn.layer.cornerRadius = 10
        logoutBtn.clipsToBounds = true
        view.addSubview(logoutBtn)
        logoutBtn.snp.makeConstraints { (make) in
            make.left.right.equalTo(meTableView)
            make.top.equalTo(meTableView.snp.bottom).offset(10)
            make.height.equalTo(40)
        }
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
