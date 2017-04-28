//
//  ViewController.swift
//  ScrollView布局
//
//  Created by 王博 on 17/4/28.
//  Copyright © 2017年 NewsInPalm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        widthConstraint.constant = 2 * view.bounds.size.width
        heightConstraint.constant = 2 * view.bounds.size.height
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

