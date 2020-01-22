//
//  ZCLoginViewController.swift
//  RXSwift-zcc
//
//  Created by 小二 on 2019/12/13.
//  Copyright © 2019 小二. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import NSObject_Rx

class ZCLoginViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "登录"
        createUI()
        
        rxSubscribe()
    }
    
    func createUI() {
        view.addSubview(contentView)
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func rxSubscribe() {
        contentView.loginTap.subscribe(onNext: {
            
        }).disposed(by: rx.disposeBag)
        
    }
    
    fileprivate lazy var contentView: ZCContentView = {
        let view = ZCContentView()
        return view
    }()
    
}
