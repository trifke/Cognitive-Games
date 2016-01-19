//
//  RotatingViewController.swift
//  CognitiveGames
//
//  Created by Apple on 1/19/16.
//  Copyright © 2016 Chaotic Neutral. All rights reserved.
//

import UIKit

class RotatingViewController: UIViewController {

    @IBOutlet weak var viewHolder: UIView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        let rotationAnimation: CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotationAnimation.toValue = NSNumber(double: M_PI * 2.0)
        rotationAnimation.duration = 36
        rotationAnimation.cumulative = true
        rotationAnimation.repeatCount = Float.infinity
        
        viewHolder.layer.addAnimation(rotationAnimation, forKey: "rotatingAnimation")
        
        viewHolder.layer.cornerRadius = (UIScreen.mainScreen().bounds.size.width - 80) / 2
        viewHolder.layer.borderColor = UIColor.lightGrayColor().CGColor
        viewHolder.layer.borderWidth = 1.0
        
        for (var i = 0; i < 10; i++)
        {
            let radius: Double = Double(viewHolder.layer.cornerRadius)
            let angle: Double = 2.0 * M_PI * Double(i) / 10
            let x: Double = radius + radius * cos(angle)
            let y: Double = radius + radius * sin(angle)
            let button: UIButton = UIButton(frame: CGRect(x: x - 38, y: y - 36, width: 72.0, height: 72.0))
            button.backgroundColor = UIColor.greenColor()
            button.layer.cornerRadius = 36
            viewHolder.addSubview(button)
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
