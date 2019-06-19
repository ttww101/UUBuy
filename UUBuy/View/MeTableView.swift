//
//  MeTableView.swift
//  UUBuy
//
//  Created by Jack on 2019/6/13.
//  Copyright © 2019 com.timi.test.test. All rights reserved.
//

import UIKit

class MeTableView: UITableView, UITableViewDataSource, UITableViewDelegate {
    
    var nav: UINavigationController? = nil
    let titles = ["购买清单", "我的竞标", "我的收藏", "领红包"]
    let viewControllers = [UIViewController(), UIViewController(), UIViewController(), UIViewController()]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let cell = dequeueReusableCell(withClass: UITableViewCell.self)
        cell.textLabel?.text = titles[row]
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let row = indexPath.row
        DispatchQueue.main.async {
            self.nav?.pushViewController(self.viewControllers[row])
        }
    }
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        delegate = self
        dataSource = self
        register(cellWithClass: UITableViewCell.self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
