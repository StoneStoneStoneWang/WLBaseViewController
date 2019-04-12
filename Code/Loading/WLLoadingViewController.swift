//
//  WLLoadingViewController.swift
//  TSBaseViewController_Swift
//
//  Created by three stone 王 on 2018/12/2.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

import UIKit
@objc (WLLoadingViewController)
open class WLLoadingViewController: WLBaseViewController {
    @objc (loadingView)
    open var loadingView: WLLoadingView = WLLoadingView(frame: .zero)
    @objc (configLoading)
    open override func configLoading() {
        
        loadingView.showToSuperView(view)
        
        loadingView.onLoadingStatusChanged(.begin)
        
        loadingView.onLoadingStatusChanged(.loading)
        
        loadingView.mDelegate = self
    }
}
extension WLLoadingViewController: WLLoadingViewDelegate {
    @objc (onReload)
    open func onReload() {
        
    }
}
