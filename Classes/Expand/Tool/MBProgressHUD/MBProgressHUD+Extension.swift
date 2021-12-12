//
//  MBProgressHUD+Extension.swift
//  MeterReadingSystem
//
//  Created by 董剑 on 2021/12/9.
//  Copyright © 2021 董剑. All rights reserved.
//

import Foundation

extension MBProgressHUD {
    /**
     生成一个hud
     - parameter inView: self.view
     - returns: MBProgressHUD
     */
    class func MRMb(in view: UIView?) -> MBProgressHUD {
        guard let superView = view else { return MBProgressHUD() }
        let foo = MBProgressHUD.init(view: superView)
        foo.removeFromSuperViewOnHide = true
        //foo.bezelView.backgroundColor = UIColor.red
        //foo.contentColor = UIColor.white
        foo.bezelView.style = .solidColor
        foo.label.numberOfLines = 2
        superView.addSubview(foo)
        return foo
    }
    
    /**
     展示 MBProgressHUDModeIndeterminate/MBProgressHUDModeDeterminate/MBProgressHUDModeDeterminateHorizontalBar/MBProgressHUDModeAnnularDeterminate/MBProgressHUDModeCustomView/MBProgressHUDModeText
     - parameter text: 展示文字
     - parameter BProgressHUDMode
     */
    func MRShow(text: String! = nil, mode: MBProgressHUDMode! = nil) {
        if let text = text {
            self.mode = .text
            bezelView.color = UIColor.init(by: "#f6f6f6")
            label.text = text
        } else {
            self.mode = .customView
            let gif = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: 133.5, height: 53.5))
            gif.contentMode = .scaleAspectFill
            gif.clipsToBounds = true
            let loading = (1...52).compactMap { (i) -> UIImage? in
                return UIImage.init(named: "loading_\(i)")?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
            }
            
            gif.animationImages = loading
            gif.animationDuration = 1.2
            gif.animationRepeatCount = 0
            gif.startAnimating()
            gif.backgroundColor = UIColor.clear
            customView = gif
            customView?.backgroundColor = UIColor.clear
            bezelView.backgroundColor = UIColor.clear
            bezelView.color = UIColor.clear
            bezelView.tintColor = UIColor.clear
        }
        if let mode = mode {
            self.mode = mode
        }
        
        show(animated: true)
    }
    
    /**
     消失
     */
    func MRHidden(after: TimeInterval! = 0, show: Any! = nil, completed: (()->(Void))! = nil) {
        guard after != nil else {
            hide(animated: true)
            removeFromSuperViewOnHide = true
            return
        }
        if let tmpText = show as? String {
            MRShow(text: tmpText, mode: .text)
        }
        hide(animated: true, afterDelay: after)
        removeFromSuperViewOnHide = true
        guard let callback = completed else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + Double(after), execute: callback)
    }
}
