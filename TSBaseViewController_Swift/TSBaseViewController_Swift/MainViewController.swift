//
//  MainViewController.swift
//  TSBaseViewController_Swift
//
//  Created by three stone 王 on 2018/11/20.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc = ViewController()
        
        addChildVC(childVC: vc, title: "首页", fontSize: 12, titleColor: .red, highColor: .yellow, imageName: "", selectedImageName: "")
        
        let vc1 = ViewController()
        
        addChildVC(childVC: vc1, title: "我的", fontSize: 12, titleColor: .red, highColor: .yellow, imageName: "", selectedImageName: "")
        
    }
}
