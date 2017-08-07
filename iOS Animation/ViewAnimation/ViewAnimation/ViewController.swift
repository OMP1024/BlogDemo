//
//  ViewController.swift
//  ViewAnimation
//
//  Created by 王博 on 17/6/30.
//  Copyright © 2017年 NewsInPalm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    /// 加载视图
    override func loadView() {
        super.loadView()
        
    }
    
    
    /// 视图将要出现的时候
    ///
    /// - Parameter animated:
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    
    /// 加载完成
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}


extension ViewController{
    func animation1() {
        UIView.animate(withDuration: 1, delay: 1, options: [.autoreverse,.repeat,.curveLinear], animations: {
            // 执行动画
        }) { (finish) in
            // 执行完成动画之后的代码块
        }
    }
    
    func animtion2() {
        UIView.animate(withDuration: 1.0, delay: 1.0, usingSpringWithDamping: 0.6, initialSpringVelocity: 4.0, options: [.autoreverse,.repeat], animations: <#T##() -> Void#>, completion: <#T##((Bool) -> Void)?##((Bool) -> Void)?##(Bool) -> Void#>)
    }
}
