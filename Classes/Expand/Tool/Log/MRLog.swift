//
//  MRLog.swift
//  MeterReadingSystem
//
//  Created by 董剑 on 2021/12/8.
//  Copyright © 2021 董剑. All rights reserved.
//

import Foundation

/// 打印
///
/// - Parameters:
///   - items: 打印内容
///   - line: 行数
///   - file: 所在文件
public func println(_ items: Any..., line: Int = #line, file: String = #file) {
    
    func getDate() -> String {
        let dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
        let formatter = DateFormatter()
        formatter.locale = NSLocale.system
        formatter.dateFormat = dateFormat
        let date = formatter.string(from: Date())
        return date
    }
    
#if DEBUG
    print(
        "🔑\(file.components(separatedBy: "/").last ?? "tmp")_\(line)",
        getDate(), ":\n",
        items.map { String(describing: $0) }.joined(separator: " ")
    )
#endif
    
}
