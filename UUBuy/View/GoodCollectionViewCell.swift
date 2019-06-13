//
//  GoodCollectionViewCell.swift
//  UUBuy
//
//  Created by Jack on 2019/6/12.
//  Copyright © 2019 com.timi.test.test. All rights reserved.
//

import UIKit
import SnapKit

class GoodCollectionViewCell: UICollectionViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    let imageView = UIImageView()
    let label = UILabel()
    let collectBtn = UIButton()
    let buyBtn = UIButton()
    let priceLabel = UILabel()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .yellow
        contentView.backgroundColor = .yellow
//
//        backgroundView = UIView()
//        backgroundView?.backgroundColor = .yellow
        
        
        addSubview(imageView)
        imageView.backgroundColor = .red
        imageView.snp.makeConstraints { (make) in
            make.width.equalTo(self)
            make.height.equalTo(self.snp.width)
        }
        addSubview(label)
        label.font = UIFont.systemFont(ofSize: 12)
        label.snp.makeConstraints { (make) in
            make.width.equalTo(self)
            make.centerX.equalTo(self)
            make.top.equalTo(imageView.snp.bottom)
        }
        label.text = "積木玩具"
        
        addSubview(collectBtn)
        collectBtn.setImage(UIImage(named: "buy_slove"), for: .normal)
        collectBtn.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 15, height: 15))
            make.top.equalTo(label.snp.bottom)
            make.left.equalTo(self)
        }
        
        addSubview(buyBtn)
        buyBtn.setImage(UIImage(named: "buy_scar"), for: .normal)
        buyBtn.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 15, height: 15))
            make.top.equalTo(label.snp.bottom)
            make.right.equalTo(self)
        }
        
        addSubview(priceLabel)
        priceLabel.textColor = redColor
        priceLabel.textAlignment = .center
        priceLabel.font = UIFont.systemFont(ofSize: 12)
        priceLabel.snp.makeConstraints { (make) in
            make.width.equalTo(self)
            make.centerX.equalTo(self)
            make.top.equalTo(label.snp.bottom)
        }
        priceLabel.text = "10元"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

let redColor = UIColor(hex: 0xFF6358)
