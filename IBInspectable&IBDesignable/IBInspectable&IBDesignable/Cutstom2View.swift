//
//  Cutstom2View.swift
//  IBInspectable&IBDesignable
//
//  Created by 王博 on 17/6/30.
//  Copyright © 2017年 NewsInPalm. All rights reserved.
//

import UIKit

class Cutstom2View: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.red
        layer.cornerRadius = 20
        layer.borderColor = UIColor.green.cgColor
        layer.borderWidth = 4
        layer.masksToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}


