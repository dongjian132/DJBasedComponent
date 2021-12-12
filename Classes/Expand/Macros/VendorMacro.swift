//
//  VendorMacro.swift
//  MeterReadingSystem
//
//  Created by 董剑 on 2021/12/8.
//  Copyright © 2021 董剑. All rights reserved.
//

import Foundation
import SwiftUI

public enum buglyKey: String {
    case userAppKey = "9000573790"
}
let bugly_userAppKey = buglyKey.userAppKey.rawValue

public enum JPushKey: String {
    #if DEV_BETA
    case userKey = "1d796ff5bc179118d982cf7d"
    #else
    case userKey = "d4c930c2f594699e6c507c8e"
    #endif
}

public enum JRWeChatKey: String {
    case pay = "wx225590bcb316a45e"
}

public enum JRTencentKey: String {
    case appId  = "101375793"
    case key = "23386a45ecd26638637961912425667a"
}

public enum JRWeiboKey: String {
    case key = "3874611277"
    case secret = "6f1686cf1e31ae0ed572e27715f20a56"
    case redirectUri = "http://www.sina.com.cn/"
}
