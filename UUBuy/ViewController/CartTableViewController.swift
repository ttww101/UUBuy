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
        navigationController?.navigationBar.setBackgroundImage(getGradientImage(width: width, height: 64), for: .default)
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        //        navigationItem.leftBarButtonItem =
        title = "购物车"
        
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
        label.text = "合计：元"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        fixedView.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.center.equalTo(fixedView)
        }
        
        let checkOutBtn = UIButton()
        checkOutBtn.setTitle("结帐", for: .normal)
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
        btn.setTitle("结算", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.setBackgroundImage(getGradientImage(width: 50, height: 100), for: .normal)
        view.addSubview(btn)
        btn.snp.makeConstraints { (make) in
            make.top.bottom.right.equalTo(fixedView)
            make.width.equalTo(100)
        }
        
        tableView.contentInset = UIEdgeInsets(top: 26, left: 0, bottom: 50, right: 0)
    }
    //    override func viewDidAppear(_ animated: Bool) {
    //        super.viewDidAppear(animated)
    //        tableView.frame = CGRect(x: 0, y: 100, width: width, height: 300)
    //    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CartModel.shared.goodModels.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withClass: CartGoodTableViewCell.self)
        let row = indexPath.row
        cell.stepper.addTarget(self, action: #selector(stepperValueChange(sender:)), for: .valueChanged)
        let good = CartModel.shared.goodModels[row]
        
        cell.goodImgView.imageURL = URL(string: good.bigImgs[0])
        cell.priceLabel.text = good.price
        cell.goodNameLabel.text = good.name
        cell.row = row
        cell.stepper.value = Double(good.count)
        
        cell.deleteBtn.rx.tap.subscribe(onNext: {
            CartModel.shared.removeGood(good: good)
            self.tableView.reloadData()
        })
        
        return cell
    }
    
    @objc
    func stepperValueChange(sender: AnyObject) {
        // Retrieve the value: stepper.value
        let sender = sender as! SnappingStepper
        let cell = sender.superview as! CartGoodTableViewCell
        let row = cell.row
        let good = CartModel.shared.goodModels[row]
        good.count = Int(sender.value)
        
        //        CartModel.shared.
        print(cell.row)
    }
    
    
}

class CartGoodTableViewCell: UITableViewCell {
    let goodImgView = UIImageView()
    let goodNameLabel = UILabel()
    let priceLabel = UILabel()
    let deleteBtn = UIButton()
    let stepper = SnappingStepper()
    var row = -1
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
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
        
        goodNameLabel.text = "fsdkaljkd"
        goodNameLabel.font = UIFont.systemFont(ofSize: 14)
        goodNameLabel.textColor = .black
        addSubview(goodNameLabel)
        goodNameLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(self).offset(-20)
            make.left.equalTo(goodImgView.snp.right).offset(10)
        }
        //        goodNameLabel.backgroundColor = .green
        
        priceLabel.text = "dsjal"
        priceLabel.font = UIFont.systemFont(ofSize: 14)
        priceLabel.textColor = UIColor(hex: 0xD96800)
        addSubview(priceLabel)
        priceLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(self).offset(20)
            make.left.equalTo(goodNameLabel)
        }
        
        deleteBtn.setImage(UIImage(named: "buy_trash"), for: .normal)
        addSubview(deleteBtn)
        deleteBtn.snp.makeConstraints { (make) in
            make.right.equalTo(self).offset(-10)
            make.top.equalTo(self).offset(10)
            make.size.equalTo(CGSize(width: 20, height: 20))
        }
        
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
    
}
