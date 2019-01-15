//
//  WLInnerViewController.swift
//  TSBaseViewController_Swift
//
//  Created by three stone 王 on 2018/12/28.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

import UIKit
import WebKit
import WLToolsKit

open class WLInnerViewController: WLLoadingViewController {
    
    open var webView: WKWebView = WKWebView(frame: .zero)
    
    open var progressView: UIProgressView = UIProgressView(frame: .zero)
        .then(closure: {
            
            $0.transform = CGAffineTransform(scaleX: 1.0, y: 1.5)
        })
    
    deinit {
        
        webView.removeObserver(self, forKeyPath: "estimatedProgress")
        
        webView.removeObserver(self, forKeyPath: "scrollView.contentSize")
    }
    open override func addOwnSubViews() {
        super.addOwnSubViews()
        
        view.addSubview(webView)
        
        view.addSubview(progressView)
    }
    
    open override func configLoading() {
        super.configLoading()
        
        let rect = loadingView.frame
        
        loadingView.frame = CGRect(x: rect.minX, y: rect.minY + (KISIPHONEX ? 89 : 64) + 2, width: rect.width, height: rect.height)
        
    }
    
    open override func configOwnSubViews() {
        super.configOwnSubViews()
        
        webView.frame = CGRect(x: 0, y: KISIPHONEX ? 89 : 64, width: view.bounds.width, height: view.bounds.height - 64)
        
        webView.navigationDelegate = self
        
        progressView.frame = CGRect(x: 0, y: KISIPHONEX ? 89 : 64, width: view.bounds.width, height: 2)
        
        webView.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: nil)
        
        webView.addObserver(self, forKeyPath: "scrollView.contentSize", options: .new, context: nil)
        
        loadReq(url: "https://www.baidu.com/")
        
    }
}

extension WLInnerViewController {
    
    override open func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        if keyPath == "estimatedProgress" {
            
            progressView.progress = Float(webView.estimatedProgress)
            
            if progressView.progress == 1 {
                /*
                 *添加一个简单的动画，将progressView的Height变为1.4倍，在开始加载网页的代理中会恢复为1.5倍
                 *动画时长0.25s，延时0.3s后开始动画
                 *动画结束后将progressView隐藏
                 */
                
                UIView.animate(withDuration: 0.25, animations: { [weak self] in
                    
                    if let strongSelf = self {
                        
                        strongSelf.progressView.transform = CGAffineTransform(scaleX: 1.0, y: 1.4)
                    }
                    
                    }, completion: { [weak self] (flag) in
                        
                        if let strongSelf = self {
                            
                            strongSelf.progressView.isHidden = true
                            
                            strongSelf.loadingView.onLoadingStatusChanged(.succ)
                        }
                })
            } else if keyPath == "scrollView.contentSize"{
                
                if !webView.isLoading {
                    
                    webView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: webView.scrollView.contentSize.height)
                    
                    webView.sizeToFit()
                    
                }
            }
        }
    }
}

extension WLInnerViewController: WKNavigationDelegate {}

extension WLInnerViewController {
    
    open func loadReq(url: String) {
        
        let req = URLRequest(url: URL(string: url)!)
        
        webView.load(req)
    }
    open func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        
        progressView.isHidden = false
        
        progressView.transform = CGAffineTransform(scaleX: 1.0, y: 1.5)
        
        view.bringSubviewToFront(progressView)
        
    }
    open func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        progressView.isHidden = true
    }
    open func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        
        progressView.isHidden = true
    }
}

