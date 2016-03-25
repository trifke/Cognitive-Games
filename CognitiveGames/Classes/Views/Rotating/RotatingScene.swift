//
//  RotatingScene.swift
//  CognitiveGames
//
//  Created by Apple on 1/28/16.
//  Copyright © 2016 Chaotic Neutral. All rights reserved.
//

import UIKit
import SpriteKit

protocol ProgressUpdate
{
    func update(success: Bool)
}

class RotatingScene: SKScene
{
    var arrayNodes: NSMutableArray = []
    var array: NSMutableArray = []
    var arrayCheck: NSMutableArray = []
    
    var delegateProgress: ProgressUpdate? = nil
    
    var node: SKShapeNode = SKShapeNode()
    
    override func didMoveToView(view: SKView)
    {
        let radius: Double = Double(240)
        
        for i in 0 ..< 10
        {
            let angle: Double = 2 * M_PI * Double(i) / 10
            let x: Double = 300 + radius * cos(angle)
            let y: Double = 300 + radius * sin(angle)
        
            let node: SKShapeNode = SKShapeNode(circleOfRadius: 56.0)
            node.position = CGPoint(x: x, y: y)
            node.zPosition = 0.0
            node.fillColor = SKColor.grayColor()
            node.name = "\(i)"
            self.addChild(node)
            arrayNodes.addObject(node)
            
            let dx = node.position.x - self.frame.width / 2
            let dy = node.position.y - self.frame.height / 2
            
            let rad = atan2(dy, dx)

            let Path = UIBezierPath(arcCenter: CGPoint(x: self.frame.width / 2, y: self.frame.height / 2), radius: CGFloat(radius), startAngle: rad, endAngle: rad + CGFloat(M_PI * 4), clockwise: true)
            let follow = SKAction.followPath(Path.CGPath, asOffset: false, orientToPath: true, speed: 200)
            node.runAction(SKAction.repeatActionForever(follow).reversedAction())
        }
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?)
    {
        let touch = touches.first!
        let viewTouchLocation = touch.locationInView(self.view)
        let sceneTouchPoint = scene!.convertPointFromView(viewTouchLocation)
        let touchedNode = scene!.nodeAtPoint(sceneTouchPoint)
        node = touchedNode as! SKShapeNode
        node.fillColor = SKColor.lightGrayColor()
        
        arrayCheck.addObject(Int(node.name!)!)
        if arrayCheck.count == array.count
        {
            if array.isEqualToArray(arrayCheck as [AnyObject])
            {
                delegateProgress!.update(true)
            }
            else
            {
                delegateProgress!.update(false)
            }
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?)
    {
        node.fillColor = SKColor.grayColor()
    }
    
    override func update(currentTime: CFTimeInterval)
    {
        
    }
    
}
