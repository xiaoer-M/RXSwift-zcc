//
//  ZCCommon.swift
//  RXSwift-zcc
//
//  Created by 小二 on 2019/12/10.
//  Copyright © 2019 小二. All rights reserved.
//

import UIKit

class ZCCommon {
    // 跳转登录界面
    class func presentLoginVC(_ vc: UIViewController) {
        let nav = ZCBaseNavController(rootViewController: ZCLoginViewController())
        nav.modalPresentationStyle = .overFullScreen
        vc.present(nav, animated: true, completion: nil)
    }
}
