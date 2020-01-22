//
//  ZCRollCallListViewController.swift
//  RXSwift-zcc
//
//  Created by 小二 on 2019/12/10.
//  Copyright © 2019 小二. All rights reserved.
//

import UIKit
import RxSwift
import RxAlamofire
import NSObject_Rx

class ZCRollCallListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        ZCNetWorkManager.shared.zc_requestJSON(request: ZCRollCallApi.getLine(start: 1)) { (response) -> (Void) in
            
        }
    }
}
