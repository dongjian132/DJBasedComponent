//
//  MRURLSchemesManager.swift
//  MeterReadingSystem
//
//  Created by 董剑 on 2021/12/9.
//  Copyright © 2021 董剑. All rights reserved.
//

import Foundation

/// 常用App的URL Scheme
///
/// - qq: QQ
/// - wechat: 微信
/// - taobao: 淘宝客户端
/// - weibo: 新浪微博客户端
/// - alipay: 支付宝客户端
/// - dianping: 大众点评客户端
public enum MRURLScheme: String {
    case qq             = "mqq://"
    case wechat         = "weixin://"
    case taobao         = "taobao://"
    case weibo          = "sinaweibo://"
    case alipay         = "alipay://"
    case dianping       = "dianping://"
}

class MRURLSchemesManager {
    class func tryToOpen(_ scheme: MRURLScheme) -> Bool {
        guard let url = URL.init(string: scheme.rawValue) else { return false }
        return UIApplication.shared.canOpenURL(url)
    }
    class func installed(_ scheme: MRURLScheme) -> Bool {
        return MRURLSchemesManager.tryToOpen(scheme)
    }
}
