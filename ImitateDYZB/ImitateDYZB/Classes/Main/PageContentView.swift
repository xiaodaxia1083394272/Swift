//
//  PageContentView.swift
//  ImitateDYZB
//
//  Created by HMRL on 16/12/26.
//  Copyright © 2016年 HMRL. All rights reserved.
//

import UIKit

private let ContentCellID = "ContentCellID"

class PageContentView: UIView {

//定义属性
    fileprivate var childVcs : [UIViewController]
    fileprivate var parentViewController : UIViewController
    
    //
    fileprivate lazy var collectView :UICollectionView = {
        
        //1.创建layout
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = self.bounds.size
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        
        //2.创建collectionView
        
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.bounces = false
        collectionView.dataSource = self
        collectionView.register(UICollectionView.self, forCellWithReuseIdentifier: ContentCellID) //@@用注册Cell！什么鬼，不太懂，跟tableview差太多了
        
        return collectionView
    }()
    
    //自定义构造器
    
    init(frame: CGRect,childVcs:[UIViewController],parentViewController:UIViewController) {
       
        self.childVcs = childVcs
        self.parentViewController = parentViewController
        
        super.init(frame:frame)
        
        setUpUI()
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// 设置UI界面
extension PageContentView {
    
    fileprivate func setUpUI() {
        
        //1,将所有子控制器添加到父控制器中
        for childVcs in childVcs{
            
            parentViewController.addChildViewController(childVcs)
        }
        
        //2.添加UICollectionView用于在cell中存放控制器的View
        
        addSubview(collectView)
        collectView.frame = bounds
        
    }
}

//遵循UICollecterViewDataSource
extension PageContentView : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return childVcs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //创建cell
        let cell = collectView.dequeueReusableCell(withReuseIdentifier: ContentCellID, for: indexPath)
        
        //给cell设置内容
        let 
    }
}






