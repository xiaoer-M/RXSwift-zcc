//
//  ZCLoginProtocols.swift
//  RXSwift-zcc
//
//  Created by 小二 on 2019/12/18.
//  Copyright © 2019 小二. All rights reserved.
//

import RxSwift
import RxCocoa

enum ValidationResult {
    case ok
    case empty
    case validating
    case failed(message: String)
}

protocol ZCLoginRequest {
    func signup(_ username: String, password: String) -> Observable<Bool>
    func getUserInfo() -> Observable<ZCLoginModel>
}

protocol ZCLoginValidationService {
    func validateUsername(_ username: String) -> Observable<ValidationResult>
    func validatePassword(_ password: String) -> ValidationResult
}

extension ValidationResult {
    var isValid: Bool {
        switch self {
        case .ok:
            return true
        default:
            return false
        }
    }
}
