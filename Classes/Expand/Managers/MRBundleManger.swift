//
//  MRBundleManger.swift
//  MeterReadingSystem
//
//  Created by 董剑 on 2021/12/10.
//  Copyright © 2021 董剑. All rights reserved.
//

import Foundation

class MRBundleManger {
    public class func MRImage(for aClass: Swift.AnyClass, name: String) -> UIImage? {
        let bundle = Bundle.init(for: aClass)
        let image = UIImage.init(named: name, in: bundle, compatibleWith: nil)
        return image
    }
}
