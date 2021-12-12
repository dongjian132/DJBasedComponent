//
//  UIButton+Extension.swift
//  MeterReadingSystem
//
//  Created by 董剑 on 2021/12/9.
//  Copyright © 2021 董剑. All rights reserved.
//

import Foundation
import Kingfisher

extension UIButton {
    func KF_setImage(with url: String?,
                         for state: UIControl.State,
                         placeholder: String?,
                         options: KingfisherOptionsInfo? = nil,
                         progressBlock: DownloadProgressBlock? = nil,
                         completionHandler: CompletionHandler? = nil) {
        kf.setImage(with: (url == nil) ? nil : URL.init(string: url!),
                    for: UIControl.State.normal,
                    placeholder:  (placeholder == nil) ? nil : UIImage.init(named: placeholder!),
                    options: options,
                    progressBlock: progressBlock,
                    completionHandler: completionHandler)
    }
}
