//
//  ZCNetWorkProtocol.swift
//  RXSwift-zcc
//
//  Created by 小二 on 2020/1/7.
//  Copyright © 2020 小二. All rights reserved.
//

import UIKit
import Alamofire

typealias RequestParam = [String: Any]
typealias RequestMethod = HTTPMethod

protocol ZCRequest {
    var http: (String, RequestMethod, RequestParam) { get }
}

extension ZCRequest {
    // 请求域名
    var baseURL: String { return "http://zccc.ngrok.i84.com.cn/" }
    
    // 请求地址
    var url: String {
        return baseURL + http.0
    }
    
    // 请求方式
    var method: HTTPMethod {
        return http.1
    }
    
    // 添加自定义请求头
    var customHeaders: [String: String] {
        let headers: [String: String] = [:]
        return headers
    }
    
    // 默认参数
    var defaultParameters: [String: Any] {
        var defaultParams: [String: Any] = [:]
        defaultParams["apptype"] = "ios"
        defaultParams["version"] = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
        return defaultParams
    }
    
    // 参数处理
    var params: [String: Any] {
        return defaultParameters.merging(http.2, uniquingKeysWith: {return $1})
    }
}
