//
//  ViewController.swift
//  IBInspectable&IBDesignable
//
//  Created by 王博 on 17/6/30.
//  Copyright © 2017年 NewsInPalm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 手动添加上去
        let customView = Bundle.main.loadNibNamed("CustomView", owner: nil, options: nil)?.last as! CustomView
        view.addSubview(customView)
    }

}

