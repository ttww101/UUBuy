//
//  OneDollarDetailTableViewController.swift
//  UUBuy
//
//  Created by Jack on 2019/6/19.
//  Copyright © 2019 com.timi.test.test. All rights reserved.
//

import UIKit
import SnappingStepper

class OneDollarDetailTableViewController: GoodDetailTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
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
        decorationView.backgroundColor = .yellow
        tableView.addSubview(decorationView)
        decorationView.snp.makeConstraints { (make) in
            make.width.equalTo(300)
            make.height.equalTo(100)
            make.centerX.equalTo(view)
            make.top.equalTo(tableView).offset(300)
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
        
        let remainTimerLabel = UILabel()
        remainTimerLabel.text = "00:00:00"
        remainTimerLabel.font = UIFont.systemFont(ofSize: 18)
        remainTimerLabel.textColor = UIColor(hex: 0xEA0000)
        decorationView.addSubview(remainTimerLabel)
        remainTimerLabel.snp.makeConstraints { (make) in
            make.right.equalTo(decorationView).offset(-50)
            make.centerY.equalTo(remainTimeTitleLabel)
        }
        
        let currentPriceLabel = UILabel()
        currentPriceLabel.text = "199"
        currentPriceLabel.font = UIFont.systemFont(ofSize: 14)
        currentPriceLabel.textColor = orangeColor
        decorationView.addSubview(currentPriceLabel)
        currentPriceLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(remainTimerLabel)
            make.centerY.equalTo(currentPriceTitleLabel)
        }
        
    }
}
