//
//  ZCBaseNavController.swift
//  RXSwift-zcc
//
//  Created by 小二 on 2019/12/10.
//  Copyright © 2019 小二. All rights reserved.
//

import UIKit

class ZCBaseNavController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //设置透明，默认为NO控制器中y=0实际效果上=64，设置为YES时控制器中y=0实际效果上y=0
        self.navigationBar.isTranslucent = false
        //设置字体颜色
        self.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18), NSAttributedString.Key.foregroundColor: UIColor.black]
        //设置背景颜色
        self.navigationBar.tintColor = UIColor.white
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        viewController.view.backgroundColor = kvcBackgroundColor
        // 第一次加载就会调用一次push，所以第一次进来数组是空的，第二次才会进判断
        if self.viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
            
            // 设置返回按钮
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: UIImage(named: "nav_back"), style: .plain, target: self, action: #selector(popView))
        }
        
        super.pushViewController(viewController, animated: true)
    }
    
    @objc func popView() {
        self.popViewController(animated: true)
    }
}
