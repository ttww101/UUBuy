//
//  CollectionViewController.swift
//  UUBuy
//
//  Created by Jack on 2019/6/12.
//  Copyright © 2019 com.timi.test.test. All rights reserved.
//

import UIKit
import Moya
import YYKit
import SVProgressHUD

private let reuseIdentifier = "Cell"
private let goodCellIdentifier = "GoodCollectionViewCell"

class HomeCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    public override func rt_navigationBarClass() -> AnyClass! {
        return MyNavavigationBar.self
    }
    
    let goodIds = [137, 144, 141, 145, 121, 111, 146, 107]
    let headerText = ["明星单品", "一元竞标"]
    //    let goodIds = [137, 137, 137, 137, 137, 137, 137, 137]
    var goodModels: [GoodModel?] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        
        // Register cell classes
        collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        collectionView!.register(GoodCollectionViewCell.self, forCellWithReuseIdentifier: goodCellIdentifier)
        collectionView.register(cellWithClass: BannerCollectionViewCell.self)
        
        collectionView.register(supplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withClass: HomeHeaderCollectionReusableView.self)
        let v = UICollectionReusableView()
        // Do any additional setup after loading the view.
        
        goodIds.map { (id) in
            goodModels.append(nil)
        }
        collectionView.backgroundColor = UIColor(hex: 0xF0F0F0)
        collectionView.dataSource = self
        collectionView.contentInset = UIEdgeInsets(top: 26, left: 0, bottom: 0, right: 0)
    }
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return 8
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section = indexPath.section
        if section == 0 {
            let bannerCell = collectionView.dequeueReusableCell(withClass: BannerCollectionViewCell.self, for: indexPath)
            return bannerCell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: goodCellIdentifier, for: indexPath) as! GoodCollectionViewCell
        
        let item = indexPath.item
        let id = goodIds[item]
        
        cell.buyBtn.rx.tap.subscribe(onNext:{
            if let good = self.goodModels[item] {
                CartModel.shared.addGood(good: good)
                SVProgressHUD.showInfo(withStatus: "加入成功")
            }
        })
        
        cell.collectBtn.rx.tap.subscribe(onNext:{
            if let good = self.goodModels[item] {
                CollectionModel.shared.addGood(good: good)
                SVProgressHUD.showInfo(withStatus: "加入成功")
            }
        })
        
        let provider = MoyaProvider<API>(plugins: [MoyaCacheablePlugin()])
        provider.request(.getProduct(id: id)) { (result) in
            switch result {
            case .success(let moyaResponse):
                let data = moyaResponse.data // 获取到的数据
                //                let statusCode = moyaResponse.statusCode // 请求状态： 200, 401, 500, etc
                
                let good = getProduct(data: data)
                self.goodModels[item] = good
                cell.label.text = good.name
                cell.priceLabel.text = good.price
                //                let imgData = try? Data(contentsOf: URL(string: good.bigImgs[0])!)
                //                cell.imageView.image = UIImage(data: imgData!)
                cell.imageView.imageURL = URL(string: good.bigImgs[0])
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        let row = indexPath.item
        let vc = GoodDetailTableViewController()
        vc.model = goodModels[row]
        vc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(vc)
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 {
            return CGSize.zero
        }
        return CGSize(width: width, height: 30)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let section = indexPath.section
        if section == 0 {
            return CGSize(width: width, height: width * 0.406)
        }
        return CGSize(width: 70, height: 110)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withClass: HomeHeaderCollectionReusableView.self, for: indexPath)
        let section = indexPath.section
        header.label.text = headerText[section-1]
        
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if section != 0 {
            return UIEdgeInsets(top: 20, left: 20, bottom: 10, right: 20)
        } else {
            return UIEdgeInsets.zero
        }
    }
    
}
