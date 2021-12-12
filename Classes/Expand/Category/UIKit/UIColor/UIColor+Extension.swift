//
//  UIColor+Extension.swift
//  MeterReadingSystem
//
//  Created by 董剑 on 2021/12/8.
//  Copyright © 2021 董剑. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    public convenience init(by hex: String) {
        let rp = hex.replacingOccurrences(of: "#", with: "0x")
        let cl = strtoul(rp.cString(using: .utf8), nil, 16)
        let r = CGFloat((cl & 0xFF0000) >> 16)
        let g = CGFloat((cl & 0x00FF00 ) >> 8)
        let b = CGFloat(cl & 0x0000FF)
        let max: CGFloat = 255
        self.init(red: r / max, green: g / max, blue: b / max, alpha: 1)
    }
    
    public convenience init(MR_red red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
}
