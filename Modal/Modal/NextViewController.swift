//
//  NextViewController.swift
//  Modal
//
//  Created by 王博 on 17/6/21.
//  Copyright © 2017年 NewsInPalm. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dismiss(animated: true, completion: nil)
    }
}
