//
//  PageTitleView.swift
//  ImitateDYZB
//
//  Created by HMRL on 16/12/26.
//  Copyright © 2016年 HMRL. All rights reserved.
//

import UIKit

private let kscrollLineH : CGFloat = 2

class PageTitleView: UIView {
    
    fileprivate var titles : [String] //这个是数组的定义
    
    //懒加载属性
    fileprivate lazy var titleLabels : [UILabel] = [UILabel]()//@@不太懂
    fileprivate lazy var scrollView : UIScrollView = {
        
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.scrollsToTop = false
        scrollView.bounces = false
        return scrollView
    }()
    
    fileprivate lazy var scrollLine : UIView = {
        
        let scrollLine = UIView()
        scrollLine.backgroundColor = UIColor.orange
        return scrollLine
    }()
    
    //自定义构造函数（跟重写是不一样的）
     init(frame: CGRect,titles:[String]) {
        self.titles = titles
        super.init(frame:frame)
        
        //设置UI
        setUpUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension PageTitleView{
    
    fileprivate func setUpUI(){
        
        //1.添加UIScrollView
        addSubview(scrollView)
        scrollView.frame = bounds
        
        //2。添加label
        setUpTitleLabels()
        
        //3.设置底线和滚动的滑块
        setUpBottomLineAndScrollLine()
        
    }
    
    private func setUpTitleLabels(){
        
        let labelW : CGFloat = frame.width / CGFloat(titles.count)
        let labelH : CGFloat = frame.height - kscrollLineH
        let labelY : CGFloat = 0

        
        for(index,title) in titles.enumerated(){
            
            let label = UILabel()
            
            label.text = title
            label.tag = index
            label.font = UIFont.systemFont(ofSize: 16.0)
            label.textColor = UIColor.darkGray
            label.textAlignment = NSTextAlignment.center
            


            let labelX : CGFloat = labelW * CGFloat(index)
            label.frame = CGRect(x: labelX, y: labelY, width: labelW, height: labelH)
            
            scrollView.addSubview(label)
            titleLabels.append(label)//@@用一个全局的数组装label用得着懒加载？
        }

    }
    
    fileprivate func setUpBottomLineAndScrollLine(){
        
        //1.添加底线
        let bottomLine = UIView()
        bottomLine.backgroundColor = UIColor.lightGray
        let lineH :CGFloat = 0.5
        bottomLine.frame = CGRect(x: 0, y: frame.height - lineH, width: frame.width, height: lineH)
        addSubview(bottomLine)
        
        //2.添加scrollLine
        //2.1获取第一个label
        guard let firstLabel = titleLabels.first else{return}
        //2.2 设置scrollLine的属性
        scrollView.addSubview(scrollLine)
        scrollLine.frame = CGRect(x: firstLabel.frame.origin.x, y: frame.height - kscrollLineH, width: firstLabel.frame.width, height: kscrollLineH)
    }
}
