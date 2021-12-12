//
//  UIImage+Extension.swift
//  MeterReadingSystem
//
//  Created by 董剑 on 2021/12/8.
//  Copyright © 2021 董剑. All rights reserved.
//

import Foundation
import UIKit

typealias MRAsset = UIImage.Asset

extension UIImage {
    
    public enum Asset : String {
        case icon_tabbar_workPlatform_normal = "icon_tabbar_workPlatform_normal"
        case icon_tabbar_mine_normal = "icon_tabbar_mine_normal"
        case icon_tabbar_workPlatform_selected = "icon_tabbar_workPlatform_selected"
        case icon_tabbar_mine_selected = "icon_tabbar_mine_selected"
        case icon_arrow_back_black_normal = "icon_arrow_back_black_normal"
        var image: UIImage {
            return UIImage.init(asset: self)
        }
    }
    
    public convenience init!(asset: Asset) {
        self.init(named: asset.rawValue)
    }
    
    public class func MRImage(imageName: String) -> UIImage? {
        guard imageName.count > 0 else {return nil}
        let result = UIImage.init(named: imageName)
        return result
    }
}


