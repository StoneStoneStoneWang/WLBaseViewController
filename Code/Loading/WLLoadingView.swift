//
//  WLLoadingView.swift
//  TSBaseViewController_Swift
//
//  Created by three stone 王 on 2018/12/2.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

import UIKit
import WLToolsKit

public typealias WLLoadingReloadAction = () -> ()
@objc (WLLoadingViewDelegate)
public protocol WLLoadingViewDelegate {
    
    func onReload()
}
@objc (WLLoadingView)
public final class WLLoadingView: UIView {
    
    public var activity: UIActivityIndicatorView = UIActivityIndicatorView(style: .gray)
    
    public var stateLabel: UILabel = UILabel().then {
        
        $0.textColor = WLHEXCOLOR(hexColor: "#666666")
        
        $0.textAlignment = .center
    }
    
    public var reloadItem: UIButton = UIButton(type: .custom)
    
    public func showToSuperView(_ superView: UIView?) {
        
        if let superView = superView {
            
            frame = superView.bounds
            
            superView.addSubview(self)
        } else {
            
            let window = UIApplication.shared.keyWindow!
            
            frame = window.bounds
            
            window.addSubview(self)
        }
    }
    
    public var mDelegate: WLLoadingViewDelegate!
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        commitInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension WLLoadingView {
    
    @objc final func commitInit() {
        
        backgroundColor = WLHEXCOLOR(hexColor: "#eeeeee")
        
        addSubview(reloadItem)
        
        addSubview(activity)
        
        addSubview(stateLabel)
        
        reloadItem.addTarget(self, action: #selector(onReloadItemClick), for: .touchUpInside)
    }
    @objc public func onReloadItemClick() {
        
        guard let delegate = mDelegate else { return }
        
        delegate.onReload()
    }
}

extension WLLoadingView {
    
    @objc public func onBegin() {
        
        stateLabel.frame = CGRect(x: 0, y: 0, width: bounds.width, height: 40)
        
        stateLabel.center = CGPoint(x: bounds.width / 2, y: bounds.height / 2 )
        
        activity.center = CGPoint(x: bounds.width / 2, y: bounds.height / 2 )
        
        reloadItem.frame = bounds
    }
    @objc public func onLoading() {
        
        activity.startAnimating()
        
        stateLabel.text = ""
        
        reloadItem.isHidden = true
    }
    
    @objc public func onFail() {
        
        activity.stopAnimating()
        
        stateLabel.text = "网络出了点小状况 请点击屏幕重新加载 \n 或者您可以查看一下网络状态"
        
        reloadItem.isHidden = false
    }
    @objc public func onSucc() { onDismiss() }
    
    @objc public func onReload() {
        
        activity.startAnimating()
        
        stateLabel.text = ""
        
        reloadItem.isHidden = true
    }
    @objc public func onDismiss() {
        
        if activity.isAnimating { activity.stopAnimating() }
        
        removeFromSuperview()
    }
}

extension WLLoadingView {
    
    public func onLoadingStatusChanged(_ status: WLLoadingStatus) {
        
        switch status {
        case .begin:onBegin()
        case .loading:onLoading()
        case .succ:onSucc()
        case .fail:onFail()
        case .dismiss:onDismiss()
        case .reload: onReload()
        }
    }
}

extension WLLoadingView {
    
    public enum WLLoadingStatus: String {
        case begin
        
        case loading
        
        case succ
        
        case fail
        
        case reload
        
        case dismiss
    }
}
