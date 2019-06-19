//
//  CartModel.swift
//  UUBuy
//
//  Created by Jack on 2019/6/19.
//  Copyright © 2019 com.timi.test.test. All rights reserved.
//

import Foundation

class CartModel: NSObject {
    static let shared = CartModel()
    var goodModels: [GoodModel] = []
    
    func addGood(good: GoodModel) {
        let goodNo = good.goodNo
        for i in goodModels {
            if i.goodNo == goodNo {
                return
            }
        }
        goodModels.append(good)
    }
    
    func removeGood(good: GoodModel) {
        let goodNo = good.goodNo
        for i in goodModels {
            if i.goodNo == goodNo {
                goodModels.removeAll(i)
            }
        }
    }
    
    func total() -> Double {
        return 0
    }
}

func archive(object: NSCoding, path: String) {
    let data = try! NSKeyedArchiver.archivedData(withRootObject: object, requiringSecureCoding: false)
    let libPath = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true).last!
    let savePath = libPath + "\(path).archiver"
    try! data.write(to: URL(string: savePath)!)
}

func unarchive(path: String) -> NSCoding {
    let libPath = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true).last!
    let savePath = libPath + "\(path).archiver"
    let data = try! Data(contentsOf: URL(string: savePath)!)
    let codingObj = try! NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data)
    return codingObj as! NSCoding
}
