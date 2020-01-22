//
//  ZCNetWorkManager.swift
//  RXSwift-zcc
//
//  Created by 小二 on 2020/1/7.
//  Copyright © 2020 小二. All rights reserved.
//

import UIKit
import RxAlamofire
import NSObject_Rx
import RxCocoa

class ZCNetWorkManager: NSObject {
    static let shared = ZCNetWorkManager()
    
    func zc_requestJSON(request: ZCRequest, comletionHandler:@escaping(_ response: [String: Any]) -> (Void)) {
        requestData(request.method, request.url, parameters: request.params)
//            .mapModel(type: ZCRollCallModel.self)
            .subscribe(onNext: { (response) in
                print(response)
            }, onError: { (error) in
                print(error.localizedDescription)
            }).disposed(by: rx.disposeBag)
    }
}
