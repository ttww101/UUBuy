//
//  AppDelegate.swift
//  UUBuy
//
//  Created by Jack on 2019/6/11.
//  Copyright © 2019 com.timi.test.test. All rights reserved.
//

import UIKit
import Moya
import SVProgressHUD

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func applicationWillTerminate(_ application: UIApplication) {
        do {
            let jsonData = try JSONEncoder().encode(CartModel.shared.goodModels)
            let jsonString = String(decoding: jsonData, as: UTF8.self)
            print(jsonString)
            archive(object: jsonString, path: "cart")
        }catch{
            print(error.localizedDescription)
        }
        
        do {
            let jsonData = try JSONEncoder().encode(CollectionModel.shared.goodModels)
            let jsonString = String(decoding: jsonData, as: UTF8.self)
            print(jsonString)
            archive(object: jsonString, path: "collection")
        }catch{
            print(error.localizedDescription)
        }
        
        do {
            let jsonData = try JSONEncoder().encode(UserModel.allUser)
            let jsonString = String(decoding: jsonData, as: UTF8.self)
            print(jsonString)
            archive(object: jsonString, path: "user")
        }catch{
            print(error.localizedDescription)
        }
        
        do {
            let jsonData = try JSONEncoder().encode(UserModel.shared)
            let jsonString = String(decoding: jsonData, as: UTF8.self)
            print(jsonString)
            archive(object: jsonString, path: "currentUser")
        }catch{
            print(error.localizedDescription)
        }
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        SVProgressHUD.setMaxSupportedWindowLevel(UIWindow.Level.alert + 1)
        do {
            let jsonStr = unarchive(path: "cart") as? String
            if let jsonStr = jsonStr {
                CartModel.shared.goodModels = try! JSONDecoder().decode(Array<GoodModel>.self,from: jsonStr.data(using: .utf8)!)
            }
        }
        
        do {
            let jsonStr = unarchive(path: "collection") as? String
            if let jsonStr = jsonStr {
                CollectionModel.shared.goodModels = try! JSONDecoder().decode(Array<GoodModel>.self,from: jsonStr.data(using: .utf8)!)
            }
        }
        
        do {
            let jsonStr = unarchive(path: "user") as? String
            if let jsonStr = jsonStr {
                UserModel.allUser = try! JSONDecoder().decode(Array<UserModel>.self,from: jsonStr.data(using: .utf8)!)
            }
        }
        
        do {
            let jsonStr = unarchive(path: "currentUser") as? String
            if let jsonStr = jsonStr {
                UserModel.shared = try! JSONDecoder().decode(UserModel.self,from: jsonStr.data(using: .utf8)!)
            }
        }
        
        
//        archive(object: ["fdsak", "123"], path: "test")
//        let str = unarchive(path: "test")
//        print(str)
        
        let MEMORY_CAPACITY = 4 * 1024 * 1024
        let DISK_CAPACITY =  20 * 1024 * 1024
        
        let cache = URLCache(memoryCapacity: MEMORY_CAPACITY, diskCapacity: DISK_CAPACITY, diskPath: nil)
        URLCache.shared = cache
        
        
        //         set rootViewController
        window = UIWindow()
        self.window = UIWindow()
        self.window?.backgroundColor = .white
        
        let layout = HomeLayout()
        //        let homeViewController = HomeCollectionViewController(collectionViewLayout: layout)
        let homeViewController = SearchableNavigationController(rootViewController: HomeCollectionViewController(collectionViewLayout: layout))
        homeViewController.tabBarItem = UITabBarItem(title: "首页", image: UIImage(named: "buy_icon_h02"), selectedImage: UIImage(named: "buy_icon_h01"))
        //        let shopViewController = UINavigationController(rootViewController: ShopViewController())
        let shopViewController = SearchableNavigationController(rootViewController: ShopViewController())
        shopViewController.tabBarItem = UITabBarItem(title: "商城", image: UIImage(named: "buy_icon_b02"), selectedImage: UIImage(named: "buy_icon_b01"))
        let oneDollarLayout = OneDollarLayout()
        let oneDollarVC = OneDollarViewController(collectionViewLayout: oneDollarLayout)
        let oneDollarViewController = SearchableNavigationController(rootViewController: oneDollarVC)
        oneDollarViewController.tabBarItem = UITabBarItem(title: "一元", image: UIImage(named: "buy_icon_m02"), selectedImage: UIImage(named: "buy_icon_m01"))
        let notificationViewController = UINavigationController(rootViewController: NotificationViewController())
        notificationViewController.navigationBar.setBackgroundImage(getGradientImage(width: width, height: 64), for: .default)
        notificationViewController.tabBarItem = UITabBarItem(title: "通知", image: UIImage(named: "buy_icon_l02"), selectedImage: UIImage(named: "buy_icon_l01"))
        
        let navController = UINavigationController(rootViewController: MeViewController())
        //        navController.navigationBar.setBackgroundImage(getGradientImage(width: width, height: 64), for: .default)
        navController.navigationBar.setBackgroundImage(UIImage(), for: .default)
        //        navController.navigationBar.shadowImage = UIImage()
        navController.navigationBar.isTranslucent = true
        navController.view.backgroundColor = .clear
        
        let meViewController = navController
        meViewController.tabBarItem = UITabBarItem(title: "个人", image: UIImage(named: "buy_icon_p02"), selectedImage: UIImage(named: "buy_icon_p01"))
        
        
        let tabBarController = UITabBarController()
        tabBarController.tabBar.isTranslucent = false
        tabBarController.tabBar.tintColor = UIColor(hex: 0xFF9500)
        let viewControllers = [homeViewController, shopViewController, oneDollarViewController, notificationViewController, meViewController]
        tabBarController.viewControllers = viewControllers
        
        
        self.window?.rootViewController = tabBarController
        self.window?.makeKeyAndVisible()
        return true
    }
    
}

