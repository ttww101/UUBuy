//
//  AppDelegate.swift
//  UUBuy
//
//  Created by Jack on 2019/6/11.
//  Copyright © 2019 com.timi.test.test. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // set rootViewController
        window = UIWindow()
        self.window = UIWindow()
        self.window?.backgroundColor = .white
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 130)
        layout.minimumLineSpacing = 5
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5);
        let viewController = CollectionViewController(collectionViewLayout: layout)
        self.window?.rootViewController = viewController
        self.window?.makeKeyAndVisible()
        let model = getProduct()
        return true
    }

}

