//
//  UIImageView+Extension.swift
//  MeterReadingSystem
//
//  Created by 董剑 on 2021/12/8.
//  Copyright © 2021 董剑. All rights reserved.
//

import Foundation
import Kingfisher

extension UIImageView {
    
    func KF_setImage(with url: String?,
                     placeholder: String?,
                     options: KingfisherOptionsInfo? = nil,
                     progressBlock: DownloadProgressBlock? = nil,
                     completionHandler: CompletionHandler? = nil) {
        kf.setImage(with: (url == nil) ? nil : URL.init(string: url!),
                    placeholder: (placeholder == nil) ? nil : UIImage.init(named: placeholder!),
                    options: options,
                    progressBlock: progressBlock,
                    completionHandler: completionHandler)
    }
}
