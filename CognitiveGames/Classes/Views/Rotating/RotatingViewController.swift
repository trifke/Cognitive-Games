//
//  RotatingViewController.swift
//  CognitiveGames
//
//  Created by Apple on 1/19/16.
//  Copyright © 2016 Chaotic Neutral. All rights reserved.
//

import UIKit
import SpriteKit

class RotatingViewController: UIViewController {

    @IBOutlet weak var viewHolder: SKView!
    
    var level: Int = 2
    var gameScene = RotatingScene(fileNamed: "RotatingScene")

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
            
            skView.presentScene(gameScene)
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //    MARK: button
    
    @IBAction func goButtonTapped(sender: AnyObject)
    {
        gameScene!.array = []
        gameScene!.arrayCheck = []
        for (var i = 0; i < level; i++)
        {
            NSTimer.scheduledTimerWithTimeInterval(Double(i * 2) * 0.8, target: self, selector: Selector("show:"), userInfo: i, repeats: false)
            NSTimer.scheduledTimerWithTimeInterval(Double(i * 2 + 1) * 0.8, target: self, selector: Selector("hide:"), userInfo: i, repeats: false)
        }
    }
    
    func show(timer: NSTimer)
    {
        let node = gameScene?.arrayNodes[randomItem()] as! SKShapeNode
        node.fillColor = SKColor.orangeColor()
    }
    
    func hide(timer: NSTimer)
    {
        let node = gameScene?.arrayNodes[gameScene!.array[timer.userInfo as! Int] as! Int] as! SKShapeNode
        node.fillColor = SKColor.grayColor()
    }
    
    func randomItem() -> Int
    {
        var random = Int(arc4random_uniform(10))
        
        while gameScene!.array.containsObject(random)
        {
            random = Int(arc4random_uniform(10))
        }
        
        gameScene!.array.addObject(random)
        
        return random;
    }
}
