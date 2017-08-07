//
//  ViewController.swift
//  iOS_Animation
//
//  Created by 王博 on 17/7/3.
//  Copyright © 2017年 NewsInPalm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let duration: TimeInterval = 2.0
    let delay: TimeInterval = 1.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension ViewController {
    
    func ViewAnimation() {
        UIView.animate(withDuration: duration) {
            // animation
        }
        
        UIView.animate(withDuration: duration, animations: {
            // animation
        }) { (finish) in
            // 动画完成之后的一些操作
        }
        
        // UIView的动画属性 bounds frame center backgroundColor alpha transform
        
        UIView.animate(withDuration: duration, delay: delay, options: [.autoreverse,.curveEaseIn], animations: {
            // 执行动画
        }) { (finish) in
            // 动画执行完毕之后的操作
        }
    }
    
    func spring() {
        
        UIView.animate(withDuration: duration, delay: delay, usingSpringWithDamping: 0.5, initialSpringVelocity: 2, options: [.autoreverse,.curveLinear], animations: { 
            // 动画执行
        }) { (_) in
            // 动画执行完毕之后的工作
        }
    }
    
    
    func transition() {
        let view1 = UIView()
        let view2 = UIView()
        
        UIView.transition(from: view1, to: view2, duration: duration, options: [.autoreverse,.curveLinear]) { (_) in
            // 执行动画
        }
        
        
        UIView.transition(with: view1, duration: duration, options: [.autoreverse,.curveLinear], animations: { 
            // 执行动画
        }) { (_) in
            // 动画执行完毕
        }
    }
    
    func keyFrame() {
        UIView.animateKeyframes(withDuration: duration, delay: delay, options: .calculationModeLinear, animations: { 
            //
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.4, animations: { 
                // 动画
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.4, relativeDuration: 0.4, animations: { 
                // 动画
            })
            
        }) { (_) in
            // 动画执行完毕
        }
    }
}

extension ViewController {

    func test12() {
        let ben = Kid()
        ben.nickname = "beijing"
        ben.age = 23
        let kidsnamekeypath = #keyPath(Kid.nickname)
        _ = ben.value(forKeyPath: kidsnamekeypath)
        ben.setValue("ben", forKey: kidsnamekeypath)
    }
}

 class Kid: NSObject {
    var nickname: String = ""
    var age: Double = 0.0
    var frends: [Kid] = []
}


