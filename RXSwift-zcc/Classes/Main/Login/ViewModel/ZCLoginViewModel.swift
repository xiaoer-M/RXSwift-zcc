//
//  ZCLoginViewModel.swift
//  RXSwift-zcc
//
//  Created by 小二 on 2019/12/18.
//  Copyright © 2019 小二. All rights reserved.
//

import UIKit
import RxSwift

class ZCLoginViewModel {
    let validateUserName: Observable<ValidationResult>
    let validatePassword: Observable<ValidationResult>
    
    let signupEnabled: Observable<Bool>
    
    
    init(input: (
        userName: Observable<String>,
        password: Observable<String>,
        loginTaps: Observable<Void>
        ),
         dependency: (
        Api: ZCLoginRequest,
        validationService: ZCLoginValidationService
        )
    ) {
        let api = dependency.Api
        let validationService = dependency.validationService


        validateUserName = input.userName.flatMapLatest({ (username) -> Observable<ValidationResult> in
            return validationService.validateUsername(username)
                .observeOn(MainScheduler.instance)
                .share(replay: 1)
        })

        validatePassword = input.password
            .map({ (password) -> ValidationResult in
                return validationService.validatePassword(password)
            })
            .share(replay: 1)
        
        signupEnabled = .just(true)

    }
}

extension ZCLoginViewModel: ZCLoginRequest {
    func signup(_ username: String, password: String) -> Observable<Bool> {
        return .just(true)
    }

    func getUserInfo() -> Observable<ZCLoginModel> {
        return .just(ZCLoginModel())
    }
}

extension ZCLoginViewModel: ZCLoginValidationService {
    func validateUsername(_ username: String) -> Observable<ValidationResult> {
        if username.isEmpty {
            return .just(.empty)
        }
        return .just(.ok)
    }
    
    func validatePassword(_ password: String) -> ValidationResult {
        if password.isEmpty {
            return .empty
        }
        return .ok
    }
}
