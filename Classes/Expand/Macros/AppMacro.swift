//
//  AppMacro.swift
//  MeterReadingSystem
//
//  Created by 董剑 on 2021/12/8.
//  Copyright © 2021 董剑. All rights reserved.
//

import Foundation
import UIKit

//MARK: --全局代理
let MRAppDelegate = UIApplication.shared.delegate as! AppDelegate
//MARK: --当前窗口
public let MRKeyWindow = UIApplication.shared.keyWindow
//MARK: --屏幕
public let kScreenBounds = UIScreen.main.bounds
public let kScreenWidth = kScreenBounds.size.width
public let kScreenHeight = kScreenBounds.size.height
//MARK: --沙盒文档路径
let kSandDocumentPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last!
//MARK: --UIColor
let TEXT_COLOR_TITLE = UIColor.init(MR_red: 13, green: 24, blue: 36)//标题类的深色
let TEXT_COLOR_SUBTITLE = UIColor.init(MR_red: 167, green: 170, blue: 173)
let TEXT_COLOR_HIGHLIGHT = UIColor.init(MR_red: 222, green: 40, blue: 49)
let LINE_COLOR_GRAY = UIColor.init(MR_red: 238, green: 236, blue: 234)//分割线颜色
let BUTTON_COLOR_RED = UIColor.init(MR_red: 222, green: 40, blue: 49)
let MaskColor = UIColor.init(MR_red: 0, green: 0, blue: 0)
let MAIN_COLOR = UIColor.init(by: "0xf4f4f4")//主色f4f4f4
let BlackColor = UIColor.init(by: "0x000000")
let GrayColor = UIColor.init(by: "0x666666")
let LineColor = UIColor.init(by: "0xf4f4f4")
let BackgroundColor = UIColor.init(by: "0xf1f2f7")
//随机颜色
func MR_RandomColor() -> UIColor {
    let aRedValue = arc4random() % 255
    let aGreenValue = arc4random() % 255
    let aBlueValue = arc4random() % 255
    return UIColor.init(red: CGFloat(aRedValue) / 255.0, green: CGFloat(aGreenValue) / 255.0, blue: CGFloat(aBlueValue) / 255.0, alpha: 1.0)
}
//MARK: --UIFont
func MRSystemFont(size:CGFloat) -> UIFont {
    return UIFont.systemFont(ofSize: size)
}






