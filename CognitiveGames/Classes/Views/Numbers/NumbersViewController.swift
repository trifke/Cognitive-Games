//
//  NumbersViewController.swift
//  CognitiveGames
//
//  Created by Apple on 3/24/16.
//  Copyright © 2016 Chaotic Neutral. All rights reserved.
//

import UIKit

class NumbersViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource
{
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var progressViewLevel: UIProgressView!
    @IBOutlet weak var constraintProgressViewLevel: NSLayoutConstraint!
    @IBOutlet weak var labelLevel: UILabel!
    
    @IBOutlet weak var progressViewDone: UIProgressView!
    @IBOutlet weak var constraintProgressViewDone: NSLayoutConstraint!
    @IBOutlet weak var labelDone: UILabel!
    
    var level: Int = 2
    var array: [Int] = []
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
    
    func numberOfSections(in collectionView: UICollectionView) -> Int
    {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell: NumbersCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "NumbersCell", for: indexPath) as! NumbersCollectionViewCell
        
        cell.configureCell()
        cell.labelNumber.text = "\((indexPath as NSIndexPath).row + 1)"
        
        return cell
    }
    
    //    MARK: Collection View delegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        let cell = collectionView.cellForItem(at: indexPath)
        UIView.animate(withDuration: 0.2, animations: {
            cell!.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }, completion: { (finished) in
            cell!.transform = CGAffineTransform.identity
        }) 
        
        arrayCheck.append((indexPath as NSIndexPath).item)
        if arrayCheck.count == array.count
        {
            if array.elementsEqual(arrayCheck.reversed()) == true
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
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath)
    {
        let cell: NumbersCollectionViewCell = collectionView.cellForItem(at: indexPath) as! NumbersCollectionViewCell
        cell.view.backgroundColor = UIColor.lightGray
    }
    
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath)
    {
        let cell: NumbersCollectionViewCell = collectionView.cellForItem(at: indexPath) as! NumbersCollectionViewCell
        cell.view.backgroundColor = UIColor.gray
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: UIScreen.main.bounds.size.width / 4 - 10, height: UIScreen.main.bounds.size.width / 4 - 10)
    }
    
    //    MARK: button
    
    @IBAction func buttonGoTapped(_ sender: AnyObject)
    {
        view.isUserInteractionEnabled = false
        array = []
        arrayCheck = []
        for i in 0 ..< level
        {
            Timer.scheduledTimer(timeInterval: Double(i * 2) * 0.8, target: self, selector: #selector(NumbersViewController.show(_:)), userInfo: i, repeats: false)
            Timer.scheduledTimer(timeInterval: Double(i * 2 + 1) * 0.8, target: self, selector: #selector(NumbersViewController.hide(_:)), userInfo: i, repeats: false)
        }
    }
    
    func show(_ timer: Timer)
    {
        let cell: NumbersCollectionViewCell = collectionView.cellForItem(at: IndexPath(item: randomItem(), section: 0)) as! NumbersCollectionViewCell
        cell.view.backgroundColor = UIColor.orange
    }
    
    func hide(_ timer: Timer)
    {
        let cell: NumbersCollectionViewCell = collectionView.cellForItem(at: IndexPath(item: array[timer.userInfo as! Int], section: 0)) as! NumbersCollectionViewCell
        cell.view.backgroundColor = UIColor.gray
        
        if timer.userInfo as! Int == level - 1
        {
            view.isUserInteractionEnabled = true
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "numbersTutorialSegue"
        {
            (segue.destination as! TutorialViewController).game = "numbers"
        }
    }
}
