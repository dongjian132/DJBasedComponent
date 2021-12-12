//
//  UIView+Extension.swift
//  MeterReadingSystem
//
//  Created by 董剑 on 2021/12/9.
//  Copyright © 2021 董剑. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher
import SwiftUI

private var kActionHandlerTapBlockKey = "kActionHandlerTapBlockKey"
private var kActionHandlerLongPressBlockKey = "kActionHandlerLongPressBlockKey"

typealias SingleTapBlock = ((_ gestureRecognizer:UITapGestureRecognizer) -> ())

extension UIView {
    //MARK: -- UIView+加圆角
    /**
     加圆角
     @param radius 圆角大小
     */
    func MR_borderRadius(radius:CGFloat) {
        self.MR_borderRadius(radius: radius, boundsSize: self.bounds.size)
    }
    
    /**
     加圆角
     @param radius 圆角大小
     @param borderWidth 内边距宽度
     @param color 内边距颜色
     */
    func MR_borderRadius(radius:CGFloat,
                         borderWidth:CGFloat,
                         borderColor:UIColor)  {
        self.MR_borderRadius(radius: radius,
                             boundsSize: self.bounds.size,
                             borderWidth: borderWidth,
                             borderColor: borderColor)
    }
    
    /**
     加圆角
     @param boundsSize 圆角尺寸
     @param radius 圆角大小
     */
    func MR_borderRadius(radius:CGFloat,
                         boundsSize:CGSize) {
        let bounds = CGRect.init(x: 0, y: 0, width: boundsSize.width, height: boundsSize.height)
        let path = UIBezierPath.init(roundedRect: bounds, cornerRadius: radius)
        let mask = CAShapeLayer.init()
        mask.frame = bounds
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
    /**
     加圆角
     @param boundsSize 视图尺寸
     @param radius 圆角大小
     @param borderWidth 内边距宽度
     @param color 内边距颜色
     */
    func MR_borderRadius(radius:CGFloat,
                         boundsSize:CGSize,
                         borderWidth:CGFloat,
                         borderColor:UIColor) {
        
        let bounds = CGRect.init(x: 0, y: 0, width: boundsSize.width, height: boundsSize.height)
        let path = UIBezierPath.init(roundedRect: bounds, cornerRadius: radius)
        let maskLayer = CAShapeLayer.init()
        maskLayer.frame = bounds
        maskLayer.path = path.cgPath
        self.layer.mask = maskLayer
        /*
        let sublayers = self.layer.sublayers
        let removedLayers = sublayers?.filter({ <#CALayer#> in
            <#code#>
        })
        
        NSPredicate.init { evaluatedObject, bindings in
            return evaluatedObject is CAShapeLayer
        }
        
        NSArray<CALayer *> *sublayers = self.layer.sublayers;
        NSArray<CALayer *> *removedLayers = [sublayers filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(id  _Nullable evaluatedObject, NSDictionary<NSString *,id> * _Nullable bindings) {
            return [evaluatedObject isKindOfClass:[CAShapeLayer class]];
        }]];
        [removedLayers enumerateObjectsUsingBlock:^(CALayer * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [obj removeFromSuperlayer];
        }];*/
        
        let layer = CAShapeLayer.init(layer: layer)
        layer.frame = bounds;
        layer.lineWidth = borderWidth * 2
        layer.strokeColor = borderColor.cgColor
        layer.fillColor = Color.clear.cgColor
        layer.path = path.cgPath
        self.layer.insertSublayer(layer, at: 0)
    }
    
    //MARK: -- UIView+手势
    /**
     添加tap手势
     @param block 代码块
     */
    
    func MR_addTapBlock(block
                        : @escaping SingleTapBlock) {
        let gesture = UITapGestureRecognizer.init(target: self, action:#selector(handleActionForTapGesture))
        self.addGestureRecognizer(gesture)
        
        objc_setAssociatedObject(self, &kActionHandlerTapBlockKey, block, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
    
    @objc func handleActionForTapGesture(gesture
                                         :UITapGestureRecognizer) {
        if gesture.state == UIGestureRecognizer.State.recognized
        {
            let block = objc_getAssociatedObject(self, &kActionHandlerTapBlockKey) as! SingleTapBlock
            block(gesture)
        }
    }
    
    /**
     添加长按手势
     @param block 代码块
     */
    func MR_addLongPressTapBlock(block
                                 :@escaping SingleTapBlock) {
        let gesture = UILongPressGestureRecognizer.init(target: self, action:#selector(handleActionForLongPressGesture))
        self.addGestureRecognizer(gesture)
        
        objc_setAssociatedObject(self, &kActionHandlerLongPressBlockKey, block, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
    
    @objc func handleActionForLongPressGesture(gesture
                                         :UITapGestureRecognizer) {
        if gesture.state == UIGestureRecognizer.State.recognized
        {
            let block = objc_getAssociatedObject(self, &kActionHandlerLongPressBlockKey) as! SingleTapBlock
            block(gesture)
        }
    }
    
    //MARK: -- UIView+Frame
    var width: CGFloat {
        get { return self.frame.size.width }
        set {
            var frame = self.frame
            frame.size.width = newValue
            self.frame = frame
        }
    }

    var height: CGFloat {
        get { return self.frame.size.height }
        set {
            var frame = self.frame
            frame.size.height = newValue
            self.frame = frame
        }
    }
    
    var size: CGSize  {
        get { return self.frame.size }
        set {
            var frame = self.frame
            frame.size = newValue
            self.frame = frame
        }
    }

    var origin: CGPoint {
        get { return self.frame.origin }
        set {
            var frame = self.frame
            frame.origin = newValue
            self.frame = frame
        }
    }
    
    var x: CGFloat {
        get { return self.frame.origin.x }
        set {
            var frame = self.frame
            frame.origin.x = newValue
            self.frame = frame
        }
    }
    var y: CGFloat {
        get { return self.frame.origin.y }
        set {
            var frame = self.frame
            frame.origin.y = newValue
            self.frame = frame
        }
    }
    
    var centerX: CGFloat {
        get { return self.center.x }
        set {
            self.center = CGPoint(x: newValue, y: self.center.y)
        }
    }
    
    var centerY: CGFloat {
        get { return self.center.y }
        set {
            self.center = CGPoint(x: self.center.x, y: newValue)
        }
    }
    
    var top : CGFloat {
        get { return self.frame.origin.y }
        set {
            var frame = self.frame
            frame.origin.y = newValue
            self.frame = frame
        }
    }
    
    var bottom : CGFloat {
        get { return frame.origin.y + frame.size.height }
        set {
            var frame = self.frame
            frame.origin.y = newValue - self.frame.size.height
            self.frame = frame
        }
    }
    
    var right : CGFloat {
        get { return self.frame.origin.x + self.frame.size.width }
        set {
            var frame = self.frame
            frame.origin.x = newValue - self.frame.size.width
            self.frame = frame
        }
    }
    
    var left : CGFloat {
        get { return self.frame.origin.x }
        set {
            var frame = self.frame
            frame.origin.x  = newValue
            self.frame = frame
        }
    }
}
