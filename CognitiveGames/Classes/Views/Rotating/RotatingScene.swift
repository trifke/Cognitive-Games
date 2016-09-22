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
    func update(_ success: Bool)
}

class RotatingScene: SKScene
{
    var arrayNodes: [SKShapeNode] = []
    var array: [Int] = []
    var arrayCheck: [Int] = []
    
    var delegateProgress: ProgressUpdate? = nil
    
    var node: SKShapeNode = SKShapeNode()
    
    override func didMove(to view: SKView)
    {
        let radius: Double = Double(300)
        
        for i in 0 ..< 10
        {
            let angle: Double = 2 * M_PI * Double(i) / 10
            let x: Double = Double(frame.width) / 2 + radius * sin(angle)
            let y: Double = Double(frame.height) / 2 + radius * cos(angle)
        
            let node: SKShapeNode = SKShapeNode(circleOfRadius: 64.0)
            node.position = CGPoint(x: x, y: y)
            node.zPosition = 0.0
            node.fillColor = SKColor.gray
            node.name = "\(i)"
            self.addChild(node)
            arrayNodes.append(node)
            
            let dx = node.position.x - frame.width / 2
            let dy = node.position.y - frame.height / 2
            
            let rad = atan2(dy, dx)

            let Path = UIBezierPath(arcCenter: CGPoint(x: frame.width / 2, y: frame.height / 2), radius: CGFloat(radius), startAngle: rad, endAngle: rad + CGFloat(M_PI * 2), clockwise: true)
            let follow = SKAction.follow(Path.cgPath, asOffset: false, orientToPath: true, speed: 128)
            node.run(SKAction.repeatForever(follow).reversed())
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        let touch = touches.first!
        let viewTouchLocation = touch.location(in: view)
        let sceneTouchPoint = scene!.convertPoint(fromView: viewTouchLocation)
        let touchedNode = scene!.atPoint(sceneTouchPoint)
        
        if touchedNode.name != "Scene"
        {
            node = touchedNode as! SKShapeNode
            node.fillColor = SKColor.lightGray
            node.setScale(0.95)
            
            arrayCheck.append(Int(node.name!)!)
            if arrayCheck.count == array.count
            {
                if array.elementsEqual(arrayCheck)
                {
                    delegateProgress!.update(true)
                }
                else
                {
                    delegateProgress!.update(false)
                }
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        node.fillColor = SKColor.gray
        node.setScale(1)
    }
    
    override func update(_ currentTime: TimeInterval)
    {
        
    }
    
}
