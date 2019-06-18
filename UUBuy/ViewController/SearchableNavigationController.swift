//
//  SearchableViewController.swift
//  UUBuy
//
//  Created by Jack on 2019/6/18.
//  Copyright © 2019 com.timi.test.test. All rights reserved.
//

import UIKit

public class SearchableNavigationController: UINavigationController {

    override public func viewDidLoad() {
        super.viewDidLoad()

//        navigationBar = MyNavavigationBar()
        navigationBar.setBackgroundImage(getGradientImage(width: width, height: 40), for: .default)
        setValue(MyNavavigationBar(), forKey: "navigationBar")
//        navigationBar.isTranslucent = true
//        view.backgroundColor = .clear
    }
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

class MyNavavigationBar: UINavigationBar {
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        var size = super.sizeThatFits(size)
        size.height += 44
        return size
    }
}
