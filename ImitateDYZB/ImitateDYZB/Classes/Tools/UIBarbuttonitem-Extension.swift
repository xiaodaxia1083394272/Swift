//
//  UIBarbuttonitem-Extension.swift
//  ImitateDYZB
//
//  Created by HMRL on 16/12/25.
//  Copyright © 2016年 HMRL. All rights reserved.
//

import UIKit

extension UIBarButtonItem{
    
  /*  class func createItem(imageName:String,hightImageName:String,size:CGSize) -> UIBarButtonItem{
        
        let btn = UIButton()
        btn.setImage(UIImage(named:imageName), for: .normal)
        btn.setImage(UIImage(named:hightImageName), for: .highlighted)
        
        btn.frame = CGRect(origin:CGPoint.zero, size: size)
        
        return UIBarButtonItem(customView: btn)
    }
 */
    //便利构造函数 1，convenient开头，2，在构造函数里必须明确调用一个设计的构造函数（self）
    convenience init(imageName:String,hightImageName:String = "",size:CGSize = CGSize.zero) {
        let btn = UIButton()
        btn.setImage(UIImage(named:imageName), for: .normal)
        if hightImageName != ""{
            
            btn.setImage(UIImage(named:hightImageName), for: .highlighted)

        }
        
        if size == CGSize.zero{
            
            btn.sizeToFit()
            
        }else{
            
            btn.frame = CGRect(origin:CGPoint.zero, size: size)

            
        }
        
        
        self.init(customView:btn)
    
    }
}
