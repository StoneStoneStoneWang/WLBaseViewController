//
//  UIViewController+config.swift
//  TSBaseViewController_Swift
//
//  Created by three stone 王 on 2018/11/20.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    @objc (configNaviItem)
    open func configNaviItem() { }
    @objc (configOwnProperties)
    open func configOwnProperties() { }
    @objc (addOwnSubViewController)
    open func addOwnSubViewController() {}
    @objc (addOwnSubViews)
    open func addOwnSubViews() { }
    @objc (configOwnSubViews)
    open func configOwnSubViews() { }
    @objc (prepareData)
    open func prepareData() { }
    @objc (configAuto)
    open func configAuto() {
        
        if #available(iOS 11.0, *) {
            
            _ = view.subviews.map {
                
                if $0 is UIScrollView {
                    
                    let scrollView = $0 as! UIScrollView;
                    
                    scrollView.contentInsetAdjustmentBehavior = .never
                }
            }
        } else {
            
            automaticallyAdjustsScrollViewInsets = false
        }
    }
    @objc (configViewModel)
    open func configViewModel() {}
    @objc (configLoading)
    open func configLoading() {}
    @objc (addNotification)
    open func addNotification() {}
    @objc (removeNotification)
    open func removeNotification() {}
}


