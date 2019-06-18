//
//  OneDollarViewController.swift
//  UUBuy
//
//  Created by Jack on 2019/6/17.
//  Copyright © 2019 com.timi.test.test. All rights reserved.
//

import UIKit

class OneDollarViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let navBar = MyNavavigationBar()
        navBar.frame = CGRect(x: 0, y: 0, width: width, height: 88)
        view.addSubview(navBar)
        // Do any additional setup after loading the view.
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
