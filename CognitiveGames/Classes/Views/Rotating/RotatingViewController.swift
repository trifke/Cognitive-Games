//
//  RotatingViewController.swift
//  CognitiveGames
//
//  Created by Apple on 1/19/16.
//  Copyright © 2016 Chaotic Neutral. All rights reserved.
//

import UIKit
import SpriteKit

class RotatingViewController: UIViewController, ProgressUpdate
{

    @IBOutlet weak var viewHolder: SKView!
    
    var level: Int = 2
    var gameScene = RotatingScene(fileNamed: "RotatingScene")
    
    @IBOutlet weak var progressViewLevel: UIProgressView!
    @IBOutlet weak var constraintProgressViewLevel: NSLayoutConstraint!
    @IBOutlet weak var labelLevel: UILabel!
    
    @IBOutlet weak var progressViewDone: UIProgressView!
    @IBOutlet weak var constraintProgressViewDone: NSLayoutConstraint!
    @IBOutlet weak var labelDone: UILabel!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        if (gameScene != nil)
        {
            // Configure the view.
            let skView = self.viewHolder as SKView
            skView.showsFPS = false
            skView.showsNodeCount = false
            skView.ignoresSiblingOrder = true
            
            gameScene!.backgroundColor = UIColor.whiteColor()
            gameScene!.size = self.viewHolder.bounds.size
            gameScene!.delegateProgress = self
            
            skView.presentScene(gameScene)
        }
        
        // Do any additional setup after loading the view.
        
        constraintProgressViewLevel.constant = 8
        constraintProgressViewDone.constant = 8        
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //    MARK: button
    
    @IBAction func goButtonTapped(sender: AnyObject)
    {
        view.userInteractionEnabled = false
        gameScene!.array = []
        gameScene!.arrayCheck = []
        for i in 0 ..< level
        {
            NSTimer.scheduledTimerWithTimeInterval(Double(i * 2) * 0.8, target: self, selector: #selector(RotatingViewController.show(_:)), userInfo: i, repeats: false)
            NSTimer.scheduledTimerWithTimeInterval(Double(i * 2 + 1) * 0.8, target: self, selector: #selector(RotatingViewController.hide(_:)), userInfo: i, repeats: false)
        }
    }
    
    func show(timer: NSTimer)
    {
        let node = gameScene?.arrayNodes[randomItem()]
        node!.fillColor = SKColor.orangeColor()
    }
    
    func hide(timer: NSTimer)
    {
        let node = gameScene?.arrayNodes[gameScene!.array[timer.userInfo as! Int]]
        node!.fillColor = SKColor.grayColor()
        
        if timer.userInfo as! Int == level - 1
        {
            view.userInteractionEnabled = true
        }
    }
    
    func randomItem() -> Int
    {
        var random = Int(arc4random_uniform(10))
        
        while gameScene!.array.contains(random)
        {
            random = Int(arc4random_uniform(10))
        }
        
        gameScene!.array.append(random)
        
        return random;
    }
    
    // MARK: progress update delegate
    
    func update(success: Bool)
    {
        if success
        {
            print("bravo")
            progressViewLevel.progress += 0.1
            progressViewDone.progress += 0.0625 * 3
            labelDone.text = "\(progressViewDone.progress * 100)%"
            if (Int(progressViewLevel.progress * 10) % 2 == 0)
            {
                level += 1
            }
        }
        else
        {
            print("nube")
            progressViewLevel.progress -= 0.1
            if (Int(progressViewLevel.progress * 10) % 2 == 0)
            {
                level -= 1
            }
        }
        labelLevel.text = "\(level) / 5"
    }
}
