//
//  ViewController.swift
//  TSBaseViewController_Swift
//
//  Created by three stone 王 on 2018/11/13.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

import UIKit
import WLToolsKit


class ViewController: WLLoadingViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(btn)
        
        btn.frame = CGRect(x: 0, y: 100, width: 100, height: 100)
        
        btn.backgroundColor = .red
        
        btn.addTarget(self, action: #selector(onClick), for: .touchUpInside)
        
        view.backgroundColor = .white
    }
    
    let btn = UIButton(type: .custom)
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        perform(#selector(delay), with: nil, afterDelay: 1)
    }
    
    @objc func delay() {
        
        loadingView.onLoadingStatusChanged(.fail)
        
        loadingView.reloadAction = { [weak self] in
            
            self!.loadingView.onLoadingStatusChanged(.reload)
        }
    }
}

extension ViewController {
    
    @objc func onClick() {
        
        let vc = ViewController()
        
        vc.title = "二级"
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
