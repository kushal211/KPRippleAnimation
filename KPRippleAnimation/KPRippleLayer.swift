//
//  KPRippleLayer.swift
//  KPRippleAnimation
// 
//  Created By: Kushal Panchal, KP
//  Created on: 25/01/18 10:34 AM
//  
//  Copyright © 2017 KP. All rights reserved.
//  
//  


import Foundation
import UIKit

class KPRippleLayer: CAReplicatorLayer {
    
    
    /* how to use :
     
     let rippleLayer = KPRippleLayer()
     rippleLayer.position = CGPoint(x: self.view.layer.bounds.midX, y: self.view.layer.bounds.midY)
     self.view.layer.addSublayer(rippleLayer)
     rippleLayer.startAnimation()
     
     */
    
    // MARK: - Private Properties
    
    /// The Ripple Effect layer object
    private var rippleEffect: CALayer?
    
    /// The Animation Group Object
    private var animationGroup: CAAnimationGroup?
    
    // MARK: - Public Properties
    
    /// Radius of the Ripple. Default value is `100.0`
    public var rippleRadius: CGFloat = 100.0
    
    /// Number of Ripple you wanted to show. Default value is `3`
    public var rippleCount: Int = 3
    
    /// Color of the Ripple border. Default value is `UIColor.orange`
    public var rippleColor: UIColor = UIColor.orange
    
    /// Color of the Ripple Backgroud Color. Default value is `UIColor.yellow`
    public var rippleBackgroudColor: UIColor = UIColor.yellow
    
    /// Number of times you wanted to repeate the Ripple animation. Default value is `1000.0`
    public var rippleRepeatCount: CGFloat = 1000.0
    
    /// Width of the Ripple border. Default value is `4`
    public var rippleWidth: CGFloat = 4
    
    
    /// Default Init method
    override init() {
        super.init()
        setupRippleEffect()
        
        repeatCount = Float(rippleRepeatCount)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSublayers() {
        super.layoutSublayers()
        
        rippleEffect?.bounds = CGRect(x: 0, y: 0, width: rippleRadius*2, height: rippleRadius*2)
        rippleEffect?.cornerRadius = rippleRadius
        instanceCount = rippleCount
        instanceDelay = 0.45
        
    }
    
    
    /// This method will start the ripple animation.
    ///
    ///         let objRippleLayer = KPRippleLayer()
    ///         objRippleLayer.position = CGPoint(x: view.layer.bounds.midX, y: view.layer.bounds.midY)
    ///         view.layer.addSublayer(objRippleLayer)
    ///         objRippleLayer.startAnimation()
    ///
    public func startAnimation() {
        setupAnimationGroup()
        rippleEffect?.add(animationGroup!, forKey: "ripple")
    }
    
    
    /// This method will stop the ripple animation.
    ///
    ///         objRippleLayer.stopAnimation()
    ///
    public func stopAnimation() {
        rippleEffect?.removeAnimation(forKey: "ripple")
    }
    
}

extension KPRippleLayer {
    
    /// This method will create a object for Ripple Effect Layer
    private func setupRippleEffect() {
        rippleEffect = CALayer()
        rippleEffect?.borderWidth = CGFloat(rippleWidth)
        rippleEffect?.borderColor = rippleColor.cgColor
        rippleEffect?.backgroundColor = rippleBackgroudColor.withAlphaComponent(0.5).cgColor
        rippleEffect?.opacity = 0
        addSublayer(rippleEffect!)
    }
    
    /// This method will create a Animation group
    private func setupAnimationGroup() {
        
        // Define animation duration.
        let animationDuration: CFTimeInterval = 3
        
        // Create Animation Group.
        let group = CAAnimationGroup()
        group.duration = animationDuration
        group.repeatCount = self.repeatCount
        group.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionDefault)
        
        // Create scale Animation.
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale.xy")
        scaleAnimation.fromValue = 0.0;
        scaleAnimation.toValue = 1.0;
        scaleAnimation.duration = animationDuration
        
        // Create alpha(opacity) Animation.
        let opacityAnimation = CAKeyframeAnimation(keyPath: "opacity")
        opacityAnimation.duration = animationDuration
        let fromAlpha = 1.0
        opacityAnimation.values = [fromAlpha, (fromAlpha * 0.5), 0];
        opacityAnimation.keyTimes = [0, 0.2, 1];
        
        // Add animations to group.
        group.animations = [scaleAnimation, opacityAnimation]
        animationGroup = group;
        animationGroup!.delegate = self;
        
    }
    
}

extension KPRippleLayer: CAAnimationDelegate {
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if let count = rippleEffect?.animationKeys()?.count , count > 0 {
            rippleEffect?.removeAllAnimations()
        }
    }
    
}
