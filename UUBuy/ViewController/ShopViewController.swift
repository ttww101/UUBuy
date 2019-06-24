//
//  ShopViewController.swift
//  UUBuy
//
//  Created by Jack on 2019/6/17.
//  Copyright © 2019 com.timi.test.test. All rights reserved.
//

import UIKit
import JXSegmentedView
import Moya

class ShopViewController: UIViewController, JXSegmentedViewDelegate, UICollectionViewDelegate {
    let segmentedDataSource = JXSegmentedTitleDataSource()
    let segmentedDataSource1 = JXSegmentedTitleDataSource()
    let segmentView1 = JXSegmentedView()

    var mainId = 0
    var goods: [(String, String, [(String, Int)])] = []
    var collectionView: ShopCollectionView! = nil
    
    public override func rt_navigationBarClass() -> AnyClass! {
        return MyNavavigationBar.self
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let navBar = MyNavavigationBar()
        view.addSubview(navBar)

        let segmentView = JXSegmentedView()
        segmentView.delegate = self
        view.addSubview(segmentView)
        segmentView.snp.makeConstraints { (make) in
            make.top.equalTo(view.snp.topMargin).offset(26)
            make.left.right.equalTo(view)
            make.height.equalTo(30)
        }

        let provider = MoyaProvider<API>(plugins: [MoyaCacheablePlugin()])
        provider.request(.getCatelory) { (result) in
            switch result {
            case .success(let moyaResponse):
                let data = moyaResponse.data // 获取到的数据
                self.goods = parseCatelory(data: data)
                var attr: [String] = []
                for good in self.goods {
                    attr.append(good.0)
                }
                self.segmentedDataSource.isTitleColorGradientEnabled = true

                self.segmentedDataSource.titles = attr
                segmentView.dataSource = self.segmentedDataSource
                self.segmentedDataSource.reloadData(selectedIndex: 0)
                segmentView.reloadData()
                self.segmentedView(segmentView, didClickSelectedItemAt: 0)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }

        let indicator = JXSegmentedIndicatorLineView()
        indicator.indicatorWidth = 20
        segmentView.indicators = [indicator]
        
        segmentView1.delegate = self
        view.addSubview(segmentView1)
        segmentView1.snp.makeConstraints { (make) in
            make.top.equalTo(segmentView.snp.bottom)
            make.left.right.equalTo(view)
            make.height.equalTo(30)
        }
        
        let indicator1 = JXSegmentedIndicatorLineView()
        indicator1.indicatorWidth = 20
        segmentView1.indicators = [indicator1]
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 150, height: 200)
        layout.minimumLineSpacing = 5
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        collectionView = ShopCollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.top.equalTo(segmentView1.snp.bottom)
            make.left.right.equalTo(view)
            make.bottom.equalTo(view.snp.bottomMargin)
        }
        
        collectionView.delegate = self
    }
    
    func segmentedView(_ segmentedView: JXSegmentedView, didClickSelectedItemAt index: Int) {
        if segmentedView == self.segmentView1 {
            var attr: [Int] = []
            let id = goods[mainId].2[index].1
            
            let provider = MoyaProvider<API>(plugins: [MoyaCacheablePlugin()])
            provider.request(.getProducts(id: id)) { (result) in
                switch result {
                case .success(let moyaResponse):
                    let data = moyaResponse.data // 获取到的数据
                    let goods = parseGoods(data: data)
                    var attr: [Int] = []
                    for good in goods {
                        attr.append(good.1)
                    }
                    self.collectionView.ids = attr
                    self.collectionView.reloadData()
                    
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            
            collectionView.ids = attr
            collectionView.reloadData()
        } else {
            var attr: [String] = []
            mainId = index
            for good in goods[index].2 {
                attr.append(good.0)
            }
            self.segmentedDataSource.isTitleColorGradientEnabled = true
        
            self.segmentedDataSource.titles = attr
            self.segmentView1.dataSource = self.segmentedDataSource
            self.segmentedDataSource.reloadData(selectedIndex: 0)
            self.segmentView1.reloadData()
            self.segmentView1.selectItemAt(index: 0)
            if first {
                first = false
                self.segmentedView(self.segmentView1, didClickSelectedItemAt: 0)
            }
            
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let row = indexPath.item
        let vc = GoodDetailTableViewController()
        
        vc.model = self.collectionView.goodModels[row]
        vc.hidesBottomBarWhenPushed = true
        
        navigationController?.pushViewController(vc)
    }
    
    var first = true

}
