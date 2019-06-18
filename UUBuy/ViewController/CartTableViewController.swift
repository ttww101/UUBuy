//
//  CartTableViewController.swift
//  UUBuy
//
//  Created by Jack on 2019/6/14.
//  Copyright © 2019 com.timi.test.test. All rights reserved.
//

import UIKit
import SnapKit
import SnappingStepper

class CartTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(cellWithClass: CartGoodTableViewCell.self)
        
        let fixedView = UIView()
        fixedView.backgroundColor = UIColor(hex: 0xF8F9FF)
        tableView.addSubview(fixedView)
        fixedView.snp.makeConstraints { (make) in
            make.left.equalTo(tableView)
            make.bottom.equalTo(tableView.safeAreaLayoutGuide.snp.bottom)
            make.height.equalTo(50)
            make.width.equalTo(tableView)
        }
        
        
        let label = UILabel()
        label.text = "合計：元"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        fixedView.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.center.equalTo(fixedView)
        }
        
        let checkOutBtn = UIButton()
        checkOutBtn.setTitle("結帳", for: .normal)
        checkOutBtn.setTitleColor(.white, for: .normal)
        checkOutBtn.backgroundColor = orangeColor
        tableView.addSubview(checkOutBtn)
        
        checkOutBtn.snp.makeConstraints { (make) in
            make.right.equalTo(tableView)
            make.bottom.equalTo(tableView.safeAreaLayoutGuide.snp.bottom)
            make.height.equalTo(50)
            make.width.equalTo(tableView).multipliedBy(0.3)
        }
        
        let btn = UIButton()
        btn.setTitle("結算", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.setBackgroundImage(getGradientImage(width: 50, height: 100), for: .normal)
        view.addSubview(btn)
        btn.snp.makeConstraints { (make) in
            make.top.bottom.right.equalTo(fixedView)
            make.width.equalTo(100)
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withClass: CartGoodTableViewCell.self)

        return cell
    }
 

}

class CartGoodTableViewCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let goodImgView = UIImageView()
        goodImgView.layer.cornerRadius = 5
        goodImgView.clipsToBounds = true
        addSubview(goodImgView)
        goodImgView.snp.makeConstraints { (make) in
            make.centerY.equalTo(self)
            make.width.height.equalTo(80)
            make.left.equalTo(self).offset(20)
            make.top.equalTo(self).offset(5)
            make.bottom.equalTo(self).offset(-5)
        }
        goodImgView.backgroundColor = .red
        
        let goodNameLabel = UILabel()
        goodNameLabel.text = "fsdkaljkd"
        goodNameLabel.font = UIFont.systemFont(ofSize: 14)
        goodNameLabel.textColor = .black
        addSubview(goodNameLabel)
        goodNameLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(self).offset(-20)
            make.left.equalTo(goodImgView.snp.right).offset(10)
        }
        goodNameLabel.backgroundColor = .green
        
        let priceLabel = UILabel()
        priceLabel.text = "dsjal"
        priceLabel.font = UIFont.systemFont(ofSize: 14)
        priceLabel.textColor = .black
        addSubview(priceLabel)
        priceLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(self).offset(20)
            make.left.equalTo(goodNameLabel)
        }
        
        let deleteBtn = UIButton()
        deleteBtn.setImage(UIImage(named: "buy_trash"), for: .normal)
        addSubview(deleteBtn)
        deleteBtn.snp.makeConstraints { (make) in
            make.right.equalTo(self).offset(-10)
            make.top.equalTo(self).offset(10)
            make.size.equalTo(CGSize(width: 20, height: 20))
        }
        
        let stepper = SnappingStepper()
        stepper.symbolFont           = UIFont(name: "TrebuchetMS-Bold", size: 15)
        stepper.symbolFontColor      = .white
        stepper.backgroundColor      = UIColor(hex: 0xFF8300)
        stepper.thumbWidthRatio      = 0.5
        stepper.thumbText            = nil
        stepper.thumbFont            = UIFont(name: "TrebuchetMS-Bold", size: 15)
        stepper.thumbBackgroundColor = .white
        stepper.thumbTextColor       = .black
//        stepper.thumbBorderColor = .red
        
        stepper.minimumValue = 1
        stepper.maximumValue = 9
        stepper.stepValue    = 1
        stepper.addTarget(self, action: #selector(valueChange(sender:)), for: .valueChanged)

        addSubview(stepper)
        stepper.snp.makeConstraints { (make) in
            make.bottom.equalTo(self).offset(-10)
            make.right.equalTo(self).offset(-10)
            make.size.equalTo(CGSize(width: 90, height: 20))
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    func valueChange(sender: AnyObject) {
        let sender = sender as! SnappingStepper
        print(sender.value)
    }
}
