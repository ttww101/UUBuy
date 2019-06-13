//
//  Network.swift
//  UUBuy
//
//  Created by Jack on 2019/6/12.
//  Copyright © 2019 com.timi.test.test. All rights reserved.
//

import Foundation
import Kanna
import SwifterSwift

func getCatelory() -> [(String, String, [(String, String)])] {
    var catelories: [(String, String, [(String, String)])] = []
    let url = URL(string: "http://www.szzzbao.cn/")
    if let doc = try? HTML(url: url!, encoding: .utf8) {
        // list
        for node in doc.css(".category-item") {
            let title = node.css(".title")[0].text!.trimmed
            let link = "http://www.szzzbao.cn/" + node.css(".title")[0]["href"]!
//            print("title: \(title), link: \(link)")
            var subList: [(String, String)] = []
            for node1 in node.css(".children-list li a span") {
                // sub list
//                print(node1.text!.trimmed)
//                print("http://www.szzzbao.cn/" + node1.parent!["href"]!)
                let subListTitle = node1.text!.trimmed
                let subListLink = "http://www.szzzbao.cn/" + node1.parent!["href"]!
                subList.append((subListTitle, subListLink))
            }
            catelories.append((title, link, subList))
        }
    }
    return catelories
}

func getProducts(url: String = "http://www.szzzbao.cn/category.php?id=80") -> [(String, String)] {
    let url = URL(string: url)
    var products: [(String, String)] = []
    if let doc = try? HTML(url: url!, encoding: .utf8) {
        // list
        for node in doc.css(".goods-item .figure a") {
            
            let title = node.text!.trimmed
            let link = "http://www.szzzbao.cn/" + node["href"]!
//            print("title: \(title), link: \(link)")
            products.append((title, link))
        }
    }
    return products
}

func getProduct(url: String = "http://www.szzzbao.cn/goods.php?id=146") -> GoodModel {
    let url = URL(string: url)
    var goodModel = GoodModel()
    let html = try? String(contentsOf: url!)
    if let doc = try? HTML(html: html!, encoding: .utf8) {
        let name = doc.css(".goods-name")[0].text!.trimmed
        let price = doc.css("#ECS_SHOPPRICE")[0].text!.trimmed

        let goodNo = doc.css(".loaded dd li em")[0].text!.trimmed
        let stockNum = doc.css(".loaded dd li em")[1].text!.trimmed
        let readySellDate = doc.css(".loaded dd li em")[2].text!.trimmed
        let goodWeight = doc.css(".loaded dd li em")[3].text!.trimmed
        let goodAvailablePoint = doc.css(".loaded dd li em")[4].text!.trimmed
        
        var smallImgs: [String] = []
        for node in doc.css("#item-thumbs img") {
            let url = "http://www.szzzbao.cn/" + node["src"]!.trimmed
            smallImgs.append(url)
        }
        
        var bigImgs: [String] = []
        for node in doc.css("#item-thumbs .bd a") {
            let url = "http://www.szzzbao.cn/" + node["href"]!.trimmed
            bigImgs.append(url)
        }
        
        var detailImgs: [String] = []
        for node in doc.css(".shape-container img") {
            let url = "http://www.szzzbao.cn/" + node["src"]!.trimmed
            detailImgs.append(url)
        }
        
        goodModel.name = name
        goodModel.price = price
        goodModel.goodNo = goodNo
        goodModel.stockNum = stockNum
        goodModel.readySellDate = readySellDate
        goodModel.goodWeight = goodWeight
        goodModel.goodAvailablePoint = goodAvailablePoint
        goodModel.smallImgs = smallImgs
        goodModel.bigImgs = bigImgs
        goodModel.detailImgs = detailImgs
    }
    return goodModel
}
