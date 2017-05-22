//
//  ViewController.swift
//  JavaScriptCore
//
//  Created by 王博 on 17/5/10.
//  Copyright © 2017年 NewsInPalm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


extension ViewController {
    
    func getJSVar() {
        let jsCode = "var arr = [1,2,3]"
        
        let ctx: JSContext = JSContext()
    }
    
}
