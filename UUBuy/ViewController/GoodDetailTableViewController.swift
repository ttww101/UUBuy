//
//  GoodDetailTableViewController.swift
//  UUBuy
//
//  Created by Jack on 2019/6/14.
//  Copyright © 2019 com.timi.test.test. All rights reserved.
//

import UIKit
import Moya
import YYKit
import ImageSlideshow
import Alamofire
let grayColor = UIColor(hex: 0xF0F0F0)
class GoodDetailTableViewController: UITableViewController {
    var model: GoodModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = grayColor
        tableView.register(cellWithClass: ImgSlidTableViewCell.self)
        tableView.register(cellWithClass: GoodInfoViewCell.self)
        tableView.register(cellWithClass: DetailImgCell.self)
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        
        let addToCartBtn = UIButton()
        addToCartBtn.setTitle("加入购物车", for: .normal)
        addToCartBtn.setTitleColor(.white, for: .normal)
        addToCartBtn.backgroundColor = .gray
        tableView.addSubview(addToCartBtn)
        
        addToCartBtn.snp.makeConstraints { (make) in
            make.left.equalTo(tableView)
            make.bottom.equalTo(tableView.safeAreaLayoutGuide.snp.bottom)
            make.height.equalTo(50)
            make.width.equalTo(tableView).multipliedBy(0.5)
        }
        
        let buyNowBtn = UIButton()
        buyNowBtn.setTitle("立即购买", for: .normal)
        buyNowBtn.setTitleColor(.white, for: .normal)
        buyNowBtn.backgroundColor = orangeColor
        tableView.addSubview(buyNowBtn)
        
        buyNowBtn.snp.makeConstraints { (make) in
            make.left.equalTo(addToCartBtn.snp.right)
            make.bottom.equalTo(tableView.safeAreaLayoutGuide.snp.bottom)
            make.height.equalTo(50)
            make.width.equalTo(tableView).multipliedBy(0.5)
        }
        
        //        navigationController?.setValue(UINavigationBar(), forKey: "navigationBar")
        
        //        let tabBarController = UIApplication.shared.keyWindow!.rootViewController as! UITabBarController
        //        tabBarController
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 2 + model!.detailImgs.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        if row == 0 {
            let cell = tableView.dequeueReusableCell(withClass: ImgSlidTableViewCell.self)
            cell.setImages(images: model!.bigImgs)
            return cell
        } else if row == 1 {
            let cell = tableView.dequeueReusableCell(withClass: GoodInfoViewCell.self)
            cell.priceLabel.text = model?.price
            cell.titleLabel.text = model?.name
            cell.goodNoLabel.text = model?.goodNo
            cell.stockNumLabel.text = model?.stockNum
            cell.readySellDateLabel.text = model?.readySellDate
            //            cell.goodDescriptionlabel.text = model?.
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withClass: DetailImgCell.self)
            //            cell.url = model!.detailImgs[row-2]
            let url = model!.detailImgs[row-2]
            cell.imgView.setImageWith(URL(string: url)!, placeholder: nil, options: .progressive) { (image, aUrl, from, stage, error) in
                if image != nil {
                    tableView.beginUpdates()
                    
                    cell.imgView.snp.remakeConstraints { (make) in
                        let imageW = image!.size.width
                        let imageH = image!.size.height
                        let height = imageH / imageW * UIScreen.main.bounds.size.width
                        print(height)
                        make.left.right.bottom.top.equalTo(cell)
                        make.width.equalTo(cell)
                        make.height.equalTo(height)
                    }
                    tableView.endUpdates()
                }
                
            }
            return cell
        }
        
        fatalError()
    }
    
    
}

class ImgSlidTableViewCell: UITableViewCell {
    func setImages(images: [String]) {
        var sources: [KingfisherSource] = []
        for i in images {
            sources.append(KingfisherSource(urlString: i)!)
        }
        imageSlideshow.setImageInputs(sources)
    }
    
    let imageSlideshow = ImageSlideshow()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //        backgroundColor = .clear
        addSubview(imageSlideshow)
        let pageIndicator = imageSlideshow.pageIndicator! as! UIPageControl
        pageIndicator.currentPageIndicatorTintColor = orangeColor
        pageIndicator.pageIndicatorTintColor = .gray
        imageSlideshow.snp.makeConstraints { (make) in
            make.left.right.top.bottom.equalTo(self)
            make.height.equalTo(400)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class GoodInfoViewCell: UITableViewCell {
    let titleLabel = UILabel()
    let goodNoLabel = UILabel()
    let priceLabel = UILabel()
    let stockNumLabel = UILabel()
    let readySellDateLabel = UILabel()
    let goodDescriptionlabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        titleLabel.text = ""
        titleLabel.font = UIFont.systemFont(ofSize: 18)
        titleLabel.textColor = .black
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(10)
            make.right.equalTo(self)
            make.top.equalTo(self).offset(10)
        }
        
        goodNoLabel.text = ""
        goodNoLabel.font = UIFont.systemFont(ofSize: 12)
        goodNoLabel.textColor = .black
        addSubview(goodNoLabel)
        goodNoLabel.snp.makeConstraints { (make) in
            make.right.equalTo(self).offset(-10)
            make.centerY.equalTo(titleLabel)
        }
        
        priceLabel.text = ""
        priceLabel.font = UIFont.systemFont(ofSize: 18)
        priceLabel.textColor = orangeColor
        addSubview(priceLabel)
        priceLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(10)
            make.right.equalTo(self)
            make.top.equalTo(goodNoLabel.snp.bottom).offset(10)
        }
        
        stockNumLabel.text = ""
        stockNumLabel.font = UIFont.systemFont(ofSize: 14)
        stockNumLabel.textColor = .black
        addSubview(stockNumLabel)
        stockNumLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(10)
            make.right.equalTo(self)
            make.top.equalTo(priceLabel.snp.bottom).offset(10)
        }
        
        readySellDateLabel.text = ""
        readySellDateLabel.font = UIFont.systemFont(ofSize: 14)
        readySellDateLabel.textColor = .black
        addSubview(readySellDateLabel)
        readySellDateLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(10)
            make.right.equalTo(self)
            make.top.equalTo(stockNumLabel.snp.bottom).offset(10)
        }
        
        goodDescriptionlabel.text = ""
        goodDescriptionlabel.font = UIFont.systemFont(ofSize: 14)
        goodDescriptionlabel.textColor = .black
        addSubview(goodDescriptionlabel)
        goodDescriptionlabel.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(10)
            make.right.equalTo(self)
            make.top.equalTo(readySellDateLabel.snp.bottom).offset(10)
            make.bottom.equalTo(self)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

class DetailImgCell: UITableViewCell {
    var url = ""
    let imgView = UIImageView(frame: CGRect.zero)
    
    func setImgUrl(url: String) {
        
        self.imgView.snp.makeConstraints { (make) in
            make.left.right.bottom.top.equalTo(self)
            make.width.equalTo(self)
            make.height.equalTo(200)
        }
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        imgView.contentMode = .scaleAspectFit
        addSubview(imgView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

let orangeColor = UIColor(hex: 0xFF9616)
