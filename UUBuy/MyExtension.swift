//
//  MyExtension.swift
//  UUBuy
//
//  Created by Jack on 2019/6/13.
//  Copyright © 2019 com.timi.test.test. All rights reserved.
//

import UIKit

let centerX = UIScreen.main.bounds.width / 2
let centerY = UIScreen.main.bounds.height / 2
let width = UIScreen.main.bounds.width
let height = UIScreen.main.bounds.height

func widthRate(rate: CGFloat) -> CGFloat {
    return width * rate
}

func heightRate(rate: CGFloat) -> CGFloat {
    return height * rate
}

extension UIImageView {
    convenience init(named: String) {
        self.init(image: UIImage(named: named))
    }
}

extension UIColor {
    convenience init(rgb: Int) {
        self.init(
            red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgb & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}

