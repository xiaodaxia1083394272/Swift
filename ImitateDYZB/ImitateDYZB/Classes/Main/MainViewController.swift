//
//  MainViewController.swift
//  ImitateDYZB
//
//  Created by HMRL on 16/12/25.
//  Copyright © 2016年 HMRL. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChildVC(stroryName: "Home")
        addChildVC(stroryName: "Live")
        addChildVC(stroryName: "Follow")
        addChildVC(stroryName: "Profile")

    }
    
    private func addChildVC(stroryName:String){
        
        //通过storybord拿到控制器
        let childVC = UIStoryboard(name: stroryName, bundle: nil).instantiateInitialViewController()!
        //将childVC作为子控制器
        
        addChildViewController(childVC)
    }
}
