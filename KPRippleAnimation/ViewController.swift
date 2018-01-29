//
//  ViewController.swift
//  KPRippleAnimation
// 
//  Created By: Kushal Panchal, KP
//  Created on: 25/01/18 10:33 AM
//  
//  Copyright © 2017 KP. All rights reserved.
//  
//  


import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let rippleLayer = KPRippleLayer()       // Create an object of the KPRippleLayer
        rippleLayer.position = CGPoint(x: view.layer.bounds.midX, y: view.layer.bounds.midY)       // Define the position
        view.layer.addSublayer(rippleLayer)     // Add to layer
        rippleLayer.startAnimation()        // Start Animation
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

