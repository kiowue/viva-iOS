//
//  CustomPresentationController.swift
//  Viva1
//
//  Created by vishwender on 8/19/18.
//  Copyright © 2018 viva. All rights reserved.
//

import Foundation
import UIKit

enum CustomPresentationAnimation {
    case bottomToTop
    case fadeIn
}

class CustomPresentationController: UIViewController, UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate {
    
    static let CustomPresentationAnimationDuration = 0.25
    
    var isPresenting = false
    var customAnimation : CustomPresentationAnimation = .fadeIn
    var duration: Double = CustomPresentationAnimationDuration
    
    func presentViewController(presentedViewController: UIViewController,
                               fromViewController presentingViewController: UIViewController,presentationAnimation animation: CustomPresentationAnimation, completion: @escaping ()->Void) {
        self.customAnimation = animation
        presentedViewController.modalPresentationStyle = .custom
        presentedViewController.transitioningDelegate = self
        presentedViewController.modalPresentationCapturesStatusBarAppearance = true
        
        presentedViewController.setNeedsStatusBarAppearanceUpdate()
        
        if presentingViewController.presentedViewController == presentedViewController {
            return
        }
        presentingViewController.present(presentedViewController, animated: true, completion: completion)
    }
    
    func presentViewController(presentedViewController: UIViewController,
                               fromViewController presentingViewController: UIViewController,presentationAnimation animation: CustomPresentationAnimation,
                               completion: @escaping ()->Void,
                               duration: Double) {
        self.duration = duration
        presentViewController(presentedViewController: presentedViewController, fromViewController: presentingViewController, presentationAnimation: animation, completion: completion)
    }
    
    
    //MARK: - UIViewControllerTransitioningDelegate
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.isPresenting = true
        return self
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.isPresenting = false
        return self
    }
    
    
    //MARK: - UIViewControllerAnimatedTransitioning
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return CustomPresentationController.CustomPresentationAnimationDuration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromVC = transitionContext.viewController(forKey: .from)
        let toVC = transitionContext.viewController(forKey: .to)
        
        let containerView = transitionContext.containerView
        
        let fromView = fromVC?.view
        guard let toView = toVC?.view else {return}
        
        let isBottomToTopAnimation = self.customAnimation == .bottomToTop
        
        if self.isPresenting {
            containerView.addSubview(toView)
            let y = isBottomToTopAnimation ? (containerView.frame.minY + containerView.frame.height) : containerView.frame.minY
            toView.frame = CGRect(x: containerView.frame.minX, y: y, width: containerView.frame.width, height: containerView.frame.height)
            
            toView.alpha = isBottomToTopAnimation ? 1.0 : 0.0
            
            UIView.animate(withDuration: CustomPresentationController.CustomPresentationAnimationDuration, animations: {()->Void in
                if isBottomToTopAnimation {
                    toView.frame = CGRect(x: containerView.frame.minX, y: (containerView.frame.minY + containerView.frame.height), width: containerView.frame.width, height: containerView.frame.height)
                } else {
                    toView.alpha = 1.0
                }
            }, completion: {(finished: Bool) -> Void in
                transitionContext.completeTransition(true)
            })
        } else {
            UIView.animate(withDuration: CustomPresentationController.CustomPresentationAnimationDuration, animations: {()->Void in
                if isBottomToTopAnimation {
                    fromView?.frame = CGRect(x: containerView.frame.minX, y: (containerView.frame.minY + containerView.frame.height), width: containerView.frame.width, height: containerView.frame.height)
                } else {
                    fromView?.alpha = 0.0
                }
            }, completion: {(finished: Bool)->Void in
                transitionContext.completeTransition(true)
            })
        }
    }
}
