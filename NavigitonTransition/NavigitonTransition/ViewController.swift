//
//  ViewController.swift
//  NavigitonTransition
//
//  Created by 王博 on 17/6/21.
//  Copyright © 2017年 NewsInPalm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // 设置代理
        self.navigationController?.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        navigationController?.pushViewController(NextViewController(), animated: true)
    }
}


extension ViewController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        // 判断是push还是pop
        switch operation {
        case .pop:
            return PopAnimation()
        case .push:
            return PushAnimation()
        default:
            return nil
        }
    }
}


/// 便于学习生成一个PushAnimation对象
class PushAnimation: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.8
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let presentedView = transitionContext.view(forKey: UITransitionContextViewKey.to)
        presentedView?.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
        presentedView?.alpha = 0.01
        transitionContext.containerView.addSubview(presentedView!)
        UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 2, options: .curveLinear, animations: {
            presentedView?.transform = CGAffineTransform.identity
            presentedView?.alpha = 1.0
        }) { (_) in
            transitionContext.completeTransition(true)
        }
    }
}


/// 生成换一个PopAnimation对象
class PopAnimation: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.8
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let presentedView = transitionContext.view(forKey: UITransitionContextViewKey.to)
        presentedView?.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
        presentedView?.alpha = 0.01
        transitionContext.containerView.addSubview(presentedView!)
        UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 2, options: .curveLinear, animations: {
            presentedView?.transform = CGAffineTransform.identity
            presentedView?.alpha = 1.0
        }) { (_) in
            transitionContext.completeTransition(true)
        }
    }
}
