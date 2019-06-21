//
//  OneDollarDetailTableViewController.swift
//  UUBuy
//
//  Created by Jack on 2019/6/19.
//  Copyright © 2019 com.timi.test.test. All rights reserved.
//

import UIKit
import SnappingStepper
import RTRootNavigationController

class OneDollarDetailTableViewController: GoodDetailTableViewController {
    override func rt_customBackItem(withTarget target: Any!, action: Selector!) -> UIBarButtonItem! {
        let btn = UIButton()
        btn.addTarget(target, action: action, for: .touchUpInside)
        btn.setImage(UIImage(named: "back"), for: .normal)
        return UIBarButtonItem(customView: btn)
    }
    
    override func isOneDollar() -> Bool {
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.setBackgroundImage(getGradientImage(width: width, height: 64), for: .default)

        let v = UIView()
        v.frame = CGRect(x: 0, y: 0, width: width, height: 50)
        tableView.tableFooterView = v
        
        addToCartBtn.isHidden = true
        buyNowBtn.isHidden = true
        
        let priceBtn = UIButton()
        let bidBtn = UIButton()
        
        priceBtn.backgroundColor = .gray
        tableView.addSubview(priceBtn)
        
        priceBtn.snp.makeConstraints { (make) in
            make.left.equalTo(tableView)
            make.bottom.equalTo(tableView.safeAreaLayoutGuide.snp.bottom)
            make.height.equalTo(50)
            make.width.equalTo(tableView).multipliedBy(0.7)
        }
        
        let stepper = SnappingStepper()
        stepper.symbolFont           = UIFont(name: "TrebuchetMS-Bold", size: 15)
        stepper.symbolFontColor      = UIColor(hex: 0xFB9400)
        stepper.backgroundColor      = UIColor(hex: 0x303030)
        stepper.thumbWidthRatio      = 0.5
        stepper.thumbText            = nil
        stepper.thumbFont            = UIFont(name: "TrebuchetMS-Bold", size: 15)
        stepper.thumbBackgroundColor = .white
        stepper.thumbTextColor       = .black
        //        stepper.thumbBorderColor = .red
        
        stepper.minimumValue = 1
        stepper.maximumValue = 9
        stepper.stepValue    = 1
        
        priceBtn.addSubview(stepper)
        stepper.snp.makeConstraints { (make) in
            make.center.equalTo(priceBtn)
            make.size.equalTo(CGSize(width: 90, height: 20))
        }
        
        bidBtn.setTitle("出价", for: .normal)
        bidBtn.setTitleColor(.white, for: .normal)
        bidBtn.backgroundColor = orangeColor
        tableView.addSubview(bidBtn)
        
        bidBtn.snp.makeConstraints { (make) in
            make.left.equalTo(priceBtn.snp.right)
            make.bottom.equalTo(tableView.safeAreaLayoutGuide.snp.bottom)
            make.height.equalTo(50)
            make.width.equalTo(tableView).multipliedBy(0.3)
        }
        
        let decorationView = UIView()
        decorationView.backgroundColor = .white
        decorationView.cornerRadius = 10
        decorationView.clipsToBounds = true
        tableView.addSubview(decorationView)
        decorationView.snp.makeConstraints { (make) in
            make.width.equalTo(300)
            make.height.equalTo(100)
            make.centerX.equalTo(view)
            make.top.equalTo(tableView).offset(350)
        }
        
        let remainTimeTitleLabel = UILabel()
        remainTimeTitleLabel.text = "剩餘時間"
        remainTimeTitleLabel.font = UIFont.systemFont(ofSize: 14)
        remainTimeTitleLabel.textColor = .gray
        decorationView.addSubview(remainTimeTitleLabel)
        remainTimeTitleLabel.snp.makeConstraints { (make) in
            make.right.equalTo(decorationView.snp.left).offset(100)
            make.top.equalTo(decorationView).offset(20)
        }

        
        let currentPriceTitleLabel = UILabel()
        currentPriceTitleLabel.text = "當前價"
        currentPriceTitleLabel.font = UIFont.systemFont(ofSize: 14)
        currentPriceTitleLabel.textColor = .gray
        decorationView.addSubview(currentPriceTitleLabel)
        currentPriceTitleLabel.snp.makeConstraints { (make) in
            make.right.equalTo(remainTimeTitleLabel)
            make.bottom.equalTo(decorationView).offset(-20)
        }
        
        let remainTimerLabel = TimerLabel()
        remainTimerLabel.text = ""
        remainTimerLabel.font = UIFont.systemFont(ofSize: 24)
        remainTimerLabel.textColor = UIColor(hex: 0xEA0000)
        decorationView.addSubview(remainTimerLabel)
        remainTimerLabel.snp.makeConstraints { (make) in
            make.right.equalTo(decorationView).offset(-50)
            make.centerY.equalTo(remainTimeTitleLabel)
        }
        
        let currentPriceLabel = UILabel()
        currentPriceLabel.text = model?.price
        currentPriceLabel.font = UIFont.systemFont(ofSize: 24)
        currentPriceLabel.textColor = orangeColor
        decorationView.addSubview(currentPriceLabel)
        currentPriceLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(remainTimerLabel)
            make.centerY.equalTo(currentPriceTitleLabel)
        }
        
        let lineView = UIView()
        lineView.backgroundColor = UIColor(hex: 0xCFCFCF)
        decorationView.addSubview(lineView)
        lineView.snp.makeConstraints { (make) in
            make.width.equalTo(280)
            make.height.equalTo(1)
            make.center.equalTo(decorationView)
        }
        
    }
}
