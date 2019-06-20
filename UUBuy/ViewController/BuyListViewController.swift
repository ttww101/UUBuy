//
//  BuyListViewController.swift
//  UUBuy
//
//  Created by Jack on 2019/6/20.
//  Copyright © 2019 com.timi.test.test. All rights reserved.
//

import UIKit

class BuyListViewController: MeViewController, UICollectionViewDelegate {
    var collectionView: ShopCollectionView! = nil

    var goodModels: [GoodModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        logoutBtn.isHidden = true
        meTableView.isHidden = true
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 150, height: 200)
        layout.minimumLineSpacing = 5
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        collectionView = ShopCollectionView(frame: CGRect(x: 15, y: 160, width: width-30, height: height - 300), collectionViewLayout: layout)
        collectionView.layer.cornerRadius = 10
        collectionView.clipsToBounds = true
        collectionView.goodModels = goodModels
        view.addSubview(collectionView)
        
        collectionView.delegate = self
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let row = indexPath.item
        let vc = GoodDetailTableViewController()
        
        vc.model = self.collectionView.goodModels[row]
        vc.hidesBottomBarWhenPushed = true
        
        navigationController?.pushViewController(vc)
    }
}
