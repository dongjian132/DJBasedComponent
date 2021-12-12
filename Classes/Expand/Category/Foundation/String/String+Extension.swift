//
//  String+Extension.swift
//  MeterReadingSystem
//
//  Created by 董剑 on 2021/12/10.
//  Copyright © 2021 董剑. All rights reserved.
//

import Foundation

extension String {
    var length: Int {
        return self.count
    }
    var double: Double {
        return Double(self) ?? 0.00
    }
}

public extension Int {
    var MRStringValue: String {
        return String(self)
    }
    
    var double: Double {
        return Double(self)
    }
}

public extension String {
     var isNumber: Bool {
        let scan: Scanner = Scanner(string: self)
        var val:Int = 0
        return scan.scanInt(&val) && scan.isAtEnd
    }
}

public extension String {
     var isMobileNumber: Bool {
        if self.count != 11 {
            return false
        }
        if self.hasPrefix("1") == false {
            return false
        }
        let predicateStr = "^[0-9]*$"
        let predicate = NSPredicate(format: "SELF MATCHES %@" ,predicateStr)
        return predicate.evaluate(with: self)
    }
            
    var isIdNumber: Bool {
        let predicateStr = "^(\\d{15}$|^\\d{18}$|^\\d{17}(\\d|X|x))$"
        let predicate =  NSPredicate(format: "SELF MATCHES %@" ,predicateStr)
        return predicate.evaluate(with: self)
    }
}

public extension String {
    // 判断昵称：数字 汉字 英文
    var isMatchNickName: Bool {
        let predicateStr = "^[a-zA-Z0-9\\u4e00-\\u9fa5-_]+$"
        let predicate =  NSPredicate(format: "SELF MATCHES %@" ,predicateStr)
        return predicate.evaluate(with: self)
    }
}

///
public extension String {
    var jsonString: String {
        let char_s: [Character] = ["\0", "\\", "\t", "\n", "\r", "\"", "\'"]
        var final_string = ""
        for c in self {
            if char_s.contains(c) {
                final_string.append("\\")
            }
            final_string.append(c)
        }
        return final_string
    }
}
