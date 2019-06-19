//
//  ShopCollectionView.swift
//  UUBuy
//
//  Created by Jack on 2019/6/17.
//  Copyright © 2019 com.timi.test.test. All rights reserved.
//

import UIKit
import Moya

class ShopCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    var ids: [Int] = []
    var goodModels: [GoodModel?] = []
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        dataSource = self
        delegate = self
        register(cellWithClass: GoodCollectionViewCell.self)
        backgroundColor = UIColor(hex: 0xF0F0F0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        ids.map { (id) in
            goodModels.append(nil)
        }
        return ids.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section = indexPath.section

        let cell = dequeueReusableCell(withClass: GoodCollectionViewCell.self, for: indexPath)
        
        let item = indexPath.item
        let id = ids[item]
        print("fajdklsfkdskal id: \(id)")
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

}
