//
//  ViewController.swift
//  Modal
//
//  Created by 王博 on 17/6/21.
//  Copyright © 2017年 NewsInPalm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let nextVc = NextViewController()
        nextVc.transitioningDelegate = self
        present(nextVc, animated: true, completion: nil)
    }
}


extension ViewController: UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return PresentAnimation()
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return DismissAnimation()
    }

}


/// PresentAnimation的动画
class PresentAnimation : NSObject, UIViewControllerAnimatedTransitioning {
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
    
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval{
        return 0.8
    }
}



/// dimiss的动画
class DismissAnimation : NSObject, UIViewControllerAnimatedTransitioning {
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let dismissView = transitionContext.view(forKey: UITransitionContextViewKey.from)
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            dismissView?.transform = CGAffineTransform(scaleX: 0.3, y: 0.3)
            dismissView?.alpha = 0
        }) { (_) in
            dismissView?.removeFromSuperview()
            transitionContext.completeTransition(true)
        }
    }
    
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval{
        return 0.8
    }
}
