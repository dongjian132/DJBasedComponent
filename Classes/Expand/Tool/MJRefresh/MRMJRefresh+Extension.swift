//
//  MRMJRefresh+Extension.swift
//  MeterReadingSystem
//
//  Created by 董剑 on 2021/12/10.
//  Copyright © 2021 董剑. All rights reserved.
//

import Foundation
import MJRefresh

extension UIScrollView {
    
    @discardableResult
    public func MR_AddRefreshHeader(_ callback: @escaping () -> ()) -> MJRefreshGifHeader? {
        let header = MJRefreshGifHeader.init(refreshingBlock: callback)
        var pulling = [UIImage]()
        (1...28).forEach {
            if let image = UIImage.init(named: "pulling_\($0)") {
                pulling.append(image)
            }
        }
        
        let other = (1...12).compactMap { (i) -> UIImage? in
            return UIImage.init(named: "refreshing_\(i)")
        }
        if let first = pulling.first {
            header.setImages([first], for: .idle)
        }
        header.setImages(pulling, for: .pulling)
        header.setImages(other, for: .refreshing)
        header.lastUpdatedTimeLabel?.isHidden = true
        header.stateLabel?.isHidden = true
        mj_header = header
        return header
    }
    
    public func MR_StopRefreshing() {
        mj_header?.endRefreshing()
    }
}
