//
//  ViewController.swift
//  TSBaseViewController_Swift
//
//  Created by three stone 王 on 2018/11/13.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

import UIKit
import TSToolKit_Swift


class ViewController: WLBaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(btn)
        
        btn.frame = CGRect(x: 0, y: 100, width: 100, height: 100)
        
        btn.backgroundColor = .red
        
        btn.addTarget(self, action: #selector(onClick), for: .touchUpInside)
        
        view.backgroundColor = .white
    }
    
    let btn = UIButton(type: .custom)
    
}

extension ViewController {
    
    @objc func onClick() {
        
        let vc = ViewController()
        
        vc.title = "二级"
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
