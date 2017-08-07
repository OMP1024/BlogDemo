//
//  CustomView.swift
//  IBInspectable&IBDesignable
//
//  Created by 王博 on 17/6/30.
//  Copyright © 2017年 NewsInPalm. All rights reserved.
//

import UIKit

// IBDesignable 的作用：使自定义的View在
@IBDesignable
class CustomView: UIView {

    override func awakeFromNib() {
        super.awakeFromNib()
    }
}


// MARK: - 对一些在xib/StoryBoard中需要设置keypath的属性，利用IBInspectable对这些属性进行扩展，使他们在xib、SB中直接可见的属性设置
extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set{
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            guard let cgColor = layer.borderColor else {
                return nil
            }
            return UIColor(cgColor: cgColor)
        }
        
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        
        set {
            layer.borderWidth = newValue
        }
    }
    
}
