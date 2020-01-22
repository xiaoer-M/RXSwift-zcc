//
//  ZCTabBarController.swift
//  RXSwift-zcc
//
//  Created by 小二 on 2019/12/10.
//  Copyright © 2019 小二. All rights reserved.
//

import UIKit

class ZCTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // 点名
        let rollcallNav = ZCBaseNavController(rootViewController: ZCRollCallListViewController())
        rollcallNav.tabBarItem = createTabbarItemWithTitle(title: "点名", imagePath: "rollcall_normal", selectedImagePath: "rollcall_selected")
        
        // 我的
        let meNav = ZCBaseNavController(rootViewController: ZCMeViewController())
        meNav.tabBarItem = createTabbarItemWithTitle(title: "我的", imagePath: "me_normal", selectedImagePath: "me_selected")
        
        self.viewControllers = [rollcallNav, meNav]
    }
    
    func createTabbarItemWithTitle(title: String, imagePath: String, selectedImagePath: String) -> UITabBarItem {
        let image = UIImage(named: imagePath)?.withRenderingMode(.alwaysOriginal)
        let selectedImage = UIImage(named: selectedImagePath)?.withRenderingMode(.alwaysOriginal)
        let item = UITabBarItem(title: title, image: image, selectedImage: selectedImage)
        item.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: kTabTextColor, NSAttributedString.Key.font: kFont(12)], for: .normal)
        item.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: kTabLightTextColor, NSAttributedString.Key.font: kFont(12)], for: .selected)
        
        // 解决iOS13bug，当我们push到下一页再次返回时，上面这种tabbar颜色设置会失效，这里设置个tintColor解决
        self.tabBar.tintColor = kTabLightTextColor
        
        return item
    }
}

