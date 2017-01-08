//
//  HomeViewController.swift
//  ImitateDYZB
//
//  Created by HMRL on 16/12/25.
//  Copyright © 2016年 HMRL. All rights reserved.
//

import UIKit

private let kTitleViewH : CGFloat = 40

class HomeViewController: UIViewController {
    
    //懒加载属性
    private lazy var pageTitleView : PageTitleView = {
        
        let titleFrame = CGRect(x: 0,y:kStatusBarH + kNavigationBarH,width:kScreenW,height:kTitleViewH)
        let titles = ["推荐","游戏","娱乐","趣玩"]
        
        let titleView = PageTitleView(frame: titleFrame, titles: titles)
        
        return titleView
    }()
    //这里类似闭包了
    
    fileprivate lazy var pageContentView : PageContentView = {
        
        //1.确定内部的frame
        let contentH = kScreenH - kStatusBarH - kNavigationBarH - kTitleViewH
        let contentFrame = CGRect(x: 0, y: kStatusBarH + kNavigationBarH + kTitleViewH, width: kScreenW, height: contentH);
        //2.确定所有的子控制器
        var childVcs = [UIViewController]()
        
        for _ in 0..<4{
            
            let vc = UIViewController()
            vc.view.backgroundColor = UIColor(r: CGFloat(arc4random_uniform(205)), g: CGFloat(arc4random_uniform(255)), b: CGFloat(arc4random_uniform(255)))
            childVcs.append(vc)
        }
        
        let contentView = PageContentView(frame: contentFrame, childVcs: childVcs, parentViewController: self)
        return contentView
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        //设置导航栏
        setUpUI()
        //添加TitleView
        view.addSubview(pageTitleView)
        
        //3.添加contentView
        view.addSubview(pageContentView)
        pageContentView.backgroundColor = UIColor.yellow
        

    }

}

// Mark :UI
extension HomeViewController{
    
    fileprivate func setUpUI(){
        //不要系统调整UIScrollView的内边距,这很重要
        automaticallyAdjustsScrollViewInsets = false
        
        //设置导航栏
        setUpNavigationBar()
    }
    
    private func setUpNavigationBar(){
        
        let btu = UIButton()
        btu.setImage(UIImage(named:"logo"), for: .normal)
    
        btu.sizeToFit()
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView:btu)
        
        let size = CGSize(width: 40,height:40)
        let historyItem = UIBarButtonItem(imageName: "image_my_history", hightImageName: "Image_my_history_click", size: size)
        let searchItem = UIBarButtonItem(imageName: "btn_search", hightImageName: "btn_search_clicked", size: size)
        let qrcCodeItem = UIBarButtonItem(imageName: "Image_scan", hightImageName: "Image_scan_click", size: size)
        
        
        
        navigationItem.rightBarButtonItems = [historyItem,searchItem,qrcCodeItem]
        
        
    }
}

