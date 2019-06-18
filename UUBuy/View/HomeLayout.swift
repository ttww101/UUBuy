//
//  HomeLayout.swift
//  UUBuy
//
//  Created by Jack on 2019/6/13.
//  Copyright © 2019 com.timi.test.test. All rights reserved.
//

import UIKit

class HomeLayout: UICollectionViewFlowLayout, UICollectionViewDelegateFlowLayout {

    override func prepare() {
        super.prepare()
        itemSize = CGSize(width: 80, height: 130)
        minimumLineSpacing = 5
        sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5);
        register(DecorationView.self, forDecorationViewOfKind: "decorationView")
    }
    
    override func layoutAttributesForDecorationView(ofKind elementKind: String, at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        let attrs = UICollectionViewLayoutAttributes(forDecorationViewOfKind: "decorationView", with: indexPath)
        if elementKind == "decorationView" {
            print("dfksljka")
            attrs.frame = CGRect(x: 0, y: 0, width: width, height: 200)
            attrs.zIndex = -1
        }
//        let numberOfItems = collectionView?.numberOfItems(inSection: indexPath.section)
//        let itemsPerRow = 4
//        let rows = (numberOfItems + itemsPerRow - 1) / itemsPerRow
        
        return attrs
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var attrs = super.layoutAttributesForElements(in: rect)!
        
        let decorationAttrs = layoutAttributesForDecorationView(ofKind: "decorationView", at: IndexPath(item: 0, section: 1))
        if let decorationAttrs = decorationAttrs {
            if rect.intersects(decorationAttrs.frame) {
//                attrs.append(decorationAttrs)
            }
        }
        
        return attrs
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: 500, height: 500)
    }
    
}
