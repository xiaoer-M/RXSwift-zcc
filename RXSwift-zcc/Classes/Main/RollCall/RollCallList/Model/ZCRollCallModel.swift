//
//  ZCRollCallModel.swift
//  RXSwift-zcc
//
//  Created by 小二 on 2020/1/8.
//  Copyright © 2020 小二. All rights reserved.
//

import UIKit
import HandyJSON

struct ZCRollCallModel: HandyJSON {
    
}

enum ZCRollCallApi: ZCRequest {
    case getLine(start: Int)
    case addLine(lineCode: String)
    
    var http: (String, RequestMethod, RequestParam) {
        let path: String = ZCRequest_Api
        let method: RequestMethod = .post
        var params: RequestParam = [:]
        
        switch self {
        case let .getLine(start):
            params = ["action":ZCRequest_MyLineList,"start": start, "limit": 20]
        case let .addLine(lineCode):
            params = ["action": ZCRequest_AddLine, "lineCode": lineCode]
        }
        
        return (path, method, params)
    }
}
