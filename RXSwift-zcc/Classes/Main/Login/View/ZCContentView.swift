//
//  ZCContentView.swift
//  RXSwift-zcc
//
//  Created by 小二 on 2019/12/13.
//  Copyright © 2019 小二. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class ZCContentView: UIView {
    
    let kTextFiledHeight: CGFloat = 40
    let kLoginBtnHeight: CGFloat = 44
    
    let loginTap = PublishSubject<Void>()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createUI()

    }
    
    func createUI() {
        self.backgroundColor = .white
        addSubview(headerImgView)
        addSubview(accountTextField)
        addSubview(passwordTextField)
        addSubview(loginBtn)
        
        headerImgView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(50)
            $0.centerX.equalToSuperview()
        }
        
        accountTextField.snp.makeConstraints {
            $0.left.equalToSuperview().offset(15)
            $0.right.equalToSuperview().offset(-15)
            $0.top.equalTo(headerImgView.snp.bottom).offset(50)
            $0.height.equalTo(kTextFiledHeight)
        }

        passwordTextField.snp.makeConstraints {
            $0.left.right.height.equalTo(accountTextField)
            $0.top.equalTo(accountTextField.snp.bottom).offset(15)
        }
        
        loginBtn.snp.makeConstraints {
            $0.left.right.height.equalTo(accountTextField)
            $0.top.equalTo(passwordTextField.snp.bottom).offset(30)
        }
    }
    
    func rxSubscribe() {
        loginBtn.rx.tap.asDriver().drive(loginTap).disposed(by: rx.disposeBag)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate lazy var headerImgView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "login_logo"))
        return imageView
    }()
    
    fileprivate lazy var accountTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = kvcBackgroundColor
        let attriString = NSAttributedString(string: "请输入手机号码", attributes: [NSAttributedString.Key.font: kFont(14), NSAttributedString.Key.foregroundColor: kGrayColor])
        textField.attributedPlaceholder = attriString
        textField.clearButtonMode = .always
        textField.returnKeyType = .next
        textField.tintColor = kMainColor
        
        // 添加左侧视图
        textField.leftViewMode = .always
        textField.leftView = createTextFieldLeftView("login_account")
        return textField
    }()
    
    fileprivate lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = kvcBackgroundColor
        let attriString = NSAttributedString(string: "请输入密码", attributes: [NSAttributedString.Key.font: kFont(14), NSAttributedString.Key.foregroundColor: kGrayColor])
        textField.attributedPlaceholder = attriString
        textField.keyboardType = .asciiCapable
        textField.returnKeyType = .done
        textField.isSecureTextEntry = true
        textField.tintColor = kMainColor
        
        // 添加左侧视图
        textField.leftViewMode = .always
        textField.leftView = createTextFieldLeftView("login_password")
        
        // 添加右侧视图
        let rightSwitch = UISwitch(frame: CGRect(x: 0, y: 4.5, width: 46, height: 28))
        rightSwitch.isOn = true;
        rightSwitch.onTintColor = kMainColor
        
        let rightView = UIView(frame: CGRect(x: 0, y: 0, width: 56, height: kTextFiledHeight))
        rightView.addSubview(rightSwitch)
        
        textField.rightViewMode = .always
        textField.rightView = rightView
        return textField
    }()
    
    fileprivate lazy var loginBtn: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = kMainColor
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = kBoldFont(18)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = kLoginBtnHeight/2
        return button
    }()
    
    func createTextFieldLeftView(_ imageName: String?) -> UIView {
        guard let imageName = imageName else {
            return UIView()
        }
        let leftImageView = UIImageView(image: UIImage(named: imageName))
        leftImageView.frame = CGRect(x: 10, y: 13, width: 14, height: 14)
        
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: kTextFiledHeight, height: kTextFiledHeight))
        leftView.addSubview(leftImageView)
        
        return leftView
    }

}
