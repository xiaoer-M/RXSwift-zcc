//
//  Observable+Extension.swift
//  RXSwift-zcc
//
//  Created by 小二 on 2020/1/8.
//  Copyright © 2020 小二. All rights reserved.
//

import Foundation
import RxSwift
import HandyJSON

//数据映射错误
enum RxMapModelError: Error {
    case parsingError
}

extension Observable where Element:Any {
    //将JSON数据转成对象
    func mapModel<T>(type:T.Type) -> Observable<T> where T:HandyJSON {
        return self.map { (element) -> T in
            print(type)
            guard let parsedElement = T.deserialize(from: element as? Dictionary) else {
                throw RxMapModelError.parsingError
            }
            
            return parsedElement
        }
    }
    
    //将JSON数据转成数组
    func mapModels<T>(type:T.Type) -> Observable<[T]> where T:HandyJSON {
        return self.map { (element) -> [T] in
            guard let parsedArray = [T].deserialize(from: element as? [Any]) else {
                throw RxMapModelError.parsingError
            }

            return parsedArray as! [T]
        }
    }
}
