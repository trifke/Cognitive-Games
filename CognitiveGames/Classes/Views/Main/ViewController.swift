//
//  ViewController.swift
//  CognitiveGames
//
//  Created by Apple on 12/22/15.
//  Copyright © 2015 Chaotic Neutral. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource
{
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var buttonMenu: UIBarButtonItem!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let revealViewControllerr = revealViewController()
        if (revealViewControllerr != nil)
        {
            buttonMenu.target = revealViewControllerr
            buttonMenu.action = #selector(SWRevealViewController.revealToggle(_:))
            navigationController?.navigationBar.addGestureRecognizer(revealViewController().panGestureRecognizer())
        }
        
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
        return 4
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        let cell: MainCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("MainMenuCell", forIndexPath: indexPath) as! MainCollectionViewCell
        
        cell.configureCell(indexPath.row)
        
        return cell
    }
    
//    MARK: Collection View delegate
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize
    {
        return CGSize(width: UIScreen.mainScreen().bounds.size.width / 2 - 12, height: UIScreen.mainScreen().bounds.size.width / 2 - 12)
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath)
    {
        switch indexPath.row
        {
            case 0:
                performSegueWithIdentifier("SortSegue", sender: nil)
                break
            
            case 1:
                performSegueWithIdentifier("RotatingSegue", sender: nil)
                break
            
            case 2:
                performSegueWithIdentifier("NumbersSegue", sender: nil)
                break
            
            case 3:
                performSegueWithIdentifier("GridSegue", sender: nil)
                break
            
            default:
                break
        }
    }
}

