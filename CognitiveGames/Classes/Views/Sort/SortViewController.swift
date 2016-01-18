//
//  SortViewController.swift
//  CognitiveGames
//
//  Created by Apple on 12/22/15.
//  Copyright © 2015 Chaotic Neutral. All rights reserved.
//

import UIKit

class SortViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource
{
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var progressViewLevel: UIProgressView!
    @IBOutlet weak var constraintProgressViewLevel: NSLayoutConstraint!
    
    @IBOutlet weak var progressViewDone: UIProgressView!
    @IBOutlet weak var constraintProgressViewDone: NSLayoutConstraint!
    
    var level: Int = 2
    var array: NSMutableArray = []
    var arrayCheck: NSMutableArray = []
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        constraintProgressViewLevel.constant = 8
        constraintProgressViewDone.constant = 8
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //    MARK: Collection View data source
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int
    {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 16
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        let cell: SortCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("SortCell", forIndexPath: indexPath) as! SortCollectionViewCell
        
        cell.configureCell()
        
        return cell
    }
    
    //    MARK: Collection View delegate
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath)
    {
        arrayCheck.addObject(indexPath.item)
        if arrayCheck.count == array.count
        {
            
            if array.isEqualToArray(arrayCheck.reverse())
            {
                print("bravo")
                progressViewLevel.progress += 0.1
                progressViewDone.progress += 0.0625 * 3
                if (Int(progressViewLevel.progress * 10) % 2 == 0)
                {
                    level++
                }
            }
            else
            {
                print("nube")
                progressViewLevel.progress -= 0.1
            }
        }
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize
    {
        return CGSize(width: UIScreen.mainScreen().bounds.size.width / 4 - 10, height: UIScreen.mainScreen().bounds.size.width / 4 - 10)
    }
    
    //    MARK: button
    
    @IBAction func buttonGoTapped(sender: AnyObject)
    {
        array = []
        arrayCheck = []
        for (var i = 0; i < level; i++)
        {
            NSTimer.scheduledTimerWithTimeInterval(Double(i * 2) * 0.8, target: self, selector: Selector("show:"), userInfo: i, repeats: false)
            NSTimer.scheduledTimerWithTimeInterval(Double(i * 2 + 1) * 0.8, target: self, selector: Selector("hide:"), userInfo: i, repeats: false)
        }
    }
    
    func show(timer: NSTimer)
    {
        let cell: SortCollectionViewCell = collectionView.cellForItemAtIndexPath(NSIndexPath(forItem: randomItem(), inSection: 0)) as! SortCollectionViewCell
        cell.labelNumber.text = "\(level - (timer.userInfo as! Int))"
        cell.labelNumber.hidden = false
    }
    
    func hide(timer: NSTimer)
    {
        let cell: SortCollectionViewCell = collectionView.cellForItemAtIndexPath(NSIndexPath(forItem: array[timer.userInfo as! Int] as! Int, inSection: 0)) as! SortCollectionViewCell
        cell.labelNumber.hidden = true
    }
    
    func randomItem() -> Int
    {
        var random = Int(arc4random_uniform(16))
        
        while array.containsObject(random)
        {
            random = Int(arc4random_uniform(16))
        }
        
        array.addObject(random)
        
        return random;
    }
}