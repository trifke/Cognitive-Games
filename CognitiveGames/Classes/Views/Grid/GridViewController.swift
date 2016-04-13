//
//  GridViewController.swift
//  CognitiveGames
//
//  Created by Apple on 3/25/16.
//  Copyright © 2016 Chaotic Neutral. All rights reserved.
//

import UIKit

class GridViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource
{
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var progressViewLevel: UIProgressView!
    @IBOutlet weak var constraintProgressViewLevel: NSLayoutConstraint!
    @IBOutlet weak var labelLevel: UILabel!
    
    @IBOutlet weak var progressViewDone: UIProgressView!
    @IBOutlet weak var constraintProgressViewDone: NSLayoutConstraint!
    @IBOutlet weak var labelDone: UILabel!
    
    var level: Int = 2
    var array : [Int] = []
    var arrayCheck: [Int] = []
    
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
        let cell: GridCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("GridCell", forIndexPath: indexPath) as! GridCollectionViewCell
        
        cell.configureCell()
        
        return cell
    }
    
    //    MARK: Collection View delegate
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath)
    {
        arrayCheck.append(indexPath.item)
        if arrayCheck.count == array.count
        {
            if array.elementsEqual(arrayCheck)
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
    
    func collectionView(collectionView: UICollectionView, didHighlightItemAtIndexPath indexPath: NSIndexPath)
    {
        let cell: GridCollectionViewCell = collectionView.cellForItemAtIndexPath(indexPath) as! GridCollectionViewCell
        cell.view.backgroundColor = UIColor.lightGrayColor()
    }
    
    func collectionView(collectionView: UICollectionView, didUnhighlightItemAtIndexPath indexPath: NSIndexPath)
    {
        let cell: GridCollectionViewCell = collectionView.cellForItemAtIndexPath(indexPath) as! GridCollectionViewCell
        cell.view.backgroundColor = UIColor.grayColor()
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize
    {
        return CGSize(width: UIScreen.mainScreen().bounds.size.width / 4 - 10, height: UIScreen.mainScreen().bounds.size.width / 4 - 10)
    }
    
    //    MARK: button
    
    @IBAction func buttonGoTapped(sender: AnyObject)
    {
        view.userInteractionEnabled = false
        array = []
        arrayCheck = []
        for i in 0 ..< level
        {
            NSTimer.scheduledTimerWithTimeInterval(Double(i * 2) * 0.8, target: self, selector: #selector(GridViewController.show(_:)), userInfo: i, repeats: false)
            NSTimer.scheduledTimerWithTimeInterval(Double(i * 2 + 1) * 0.8, target: self, selector: #selector(GridViewController.hide(_:)), userInfo: i, repeats: false)
        }
    }
    
    func show(timer: NSTimer)
    {
        let cell: GridCollectionViewCell = collectionView.cellForItemAtIndexPath(NSIndexPath(forItem: randomItem(), inSection: 0)) as! GridCollectionViewCell
        cell.view.backgroundColor = UIColor.orangeColor()
    }
    
    func hide(timer: NSTimer)
    {
        let cell: GridCollectionViewCell = collectionView.cellForItemAtIndexPath(NSIndexPath(forItem: array[timer.userInfo as! Int], inSection: 0)) as! GridCollectionViewCell
        cell.view.backgroundColor = UIColor.grayColor()
        
        if timer.userInfo as! Int == level - 1
        {
            view.userInteractionEnabled = true
        }
    }
    
    func randomItem() -> Int
    {
        var random = Int(arc4random_uniform(16))
        
        while array.contains(random)
        {
            random = Int(arc4random_uniform(16))
        }
        
        array.append(random)
        
        return random;
    }
}