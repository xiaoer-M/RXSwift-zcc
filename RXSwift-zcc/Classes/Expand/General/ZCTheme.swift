//
//  ZCTheme.swift
//  RXSwift-zcc
//
//  Created by 小二 on 2019/12/10.
//  Copyright © 2019 小二. All rights reserved.
//

import UIKit

/************** 主题颜色  ************/
let kMainColor = ZCTheme.colorWithHexString(0x584024)
// 控制器统一背景
let kvcBackgroundColor = ZCTheme.colorWithHexString(0xfaf9f5)
// Tabbar
let kTabLightTextColor = ZCTheme.colorWithHexString(0xFFDA2A)
let kTabTextColor = ZCTheme.colorWithHexString(0xBCBCBC)
//me
let kTextColor = ZCTheme.colorWithHexString(0x262626)
let kGrayColor = ZCTheme.colorWithHexString(0x666666)
let kPaleColor = ZCTheme.colorWithHexString(0x999999)
let kMostlightTextColor = ZCTheme.colorWithHexString(0xAAAAAA)
//rollcall
let kLineBgColor = ZCTheme.colorWithHexString(0xE5E5E5)
let kYellowBgColor = ZCTheme.colorWithHexString(0xFFDA2A)



/************** 字体  ************/
func kFont(_ size: CGFloat) -> UIFont {
    return UIFont.systemFont(ofSize: size, weight: UIFont.Weight.regular)
}

func kMediumFont(_ size: CGFloat) -> UIFont {
    return UIFont.systemFont(ofSize: size, weight: UIFont.Weight.medium)
}

func kBoldFont(_ size: CGFloat) -> UIFont {
    return UIFont.systemFont(ofSize: size, weight: UIFont.Weight.bold)
}


class ZCTheme: NSObject {
    // 16进制转颜色
    static func colorWithHexString(_ color_vaule : UInt64 , alpha : CGFloat = 1) -> UIColor {
        let redValue = CGFloat((color_vaule & 0xFF0000) >> 16)/255.0
        let greenValue = CGFloat((color_vaule & 0xFF00) >> 8)/255.0
        let blueValue = CGFloat(color_vaule & 0xFF)/255.0
        return UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: alpha)
    }
}




/*********** 尺寸 ***********/
let kScreenWidth = UIScreen.main.bounds.size.width
let kScreenHeight = UIScreen.main.bounds.size.height

let kStatusBarAndNavigationBarHeight = kIs_iPhoneX() ? 88 : 44
let kSafeAreaBottomHeight = kIs_iPhoneX() ? 34 : 0
let kTabBarHeight = 49
let kLineHeight = 1/UIScreen.main.scale  //线高度


// 具体机型适配引导页
// iPhone5 iPhone5s iPhoneSE
let IS_iPhone_SE =  (UIScreen.instancesRespond(to: #selector(getter: UIScreen.main.currentMode)) ? CGSize(width: 640, height: 1136).equalTo((UIScreen.main.currentMode?.size)!) : false)

// iPhone6 7 8
let IS_iPhone_8 =  (UIScreen.instancesRespond(to: #selector(getter: UIScreen.main.currentMode)) ? CGSize(width: 750, height: 1334).equalTo((UIScreen.main.currentMode?.size)!) : false)

// iphoneXR
let IS_iPhone_XR =  (UIScreen.instancesRespond(to: #selector(getter: UIScreen.main.currentMode)) ? CGSize(width: 828, height: 1792).equalTo((UIScreen.main.currentMode?.size)!) : false)

// iPhone6plus  iPhone7plus iPhone8plus
let IS_iPhone8_Plus =  (UIScreen.instancesRespond(to: #selector(getter: UIScreen.main.currentMode)) ? CGSize(width: 1242, height: 2208).equalTo((UIScreen.main.currentMode?.size)!) : false)

// iPhoneX
let IS_iPhoneX =  (UIScreen.instancesRespond(to: #selector(getter: UIScreen.main.currentMode)) ? CGSize(width: 1125, height: 2436).equalTo((UIScreen.main.currentMode?.size)!) : false)

// iphoneXsMax
let IS_iPhoneXsMax =  (UIScreen.instancesRespond(to: #selector(getter: UIScreen.main.currentMode)) ? CGSize(width: 1242, height: 2688).equalTo((UIScreen.main.currentMode?.size)!) : false)



//按iphone6适配宽高
func adapterWidth(_ width: CGFloat) -> CGFloat {
    return width * kScreenWidth/375
}

func AdapterHeight(_ height: CGFloat) -> CGFloat {
    return height * kScreenHeight/667
}

//适配刘海机型
func kIs_iPhoneX() -> Bool {
    guard #available(iOS 11.0, *) else {
        return false
    }
    return UIApplication.shared.windows[0].safeAreaInsets != UIEdgeInsets.zero
}
