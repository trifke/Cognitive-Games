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
    
    func numberOfSections(in collectionView: UICollectionView) -> Int
    {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell: MainCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainMenuCell", for: indexPath) as! MainCollectionViewCell
        
        cell.configureCell((indexPath as NSIndexPath).row)
        
        return cell
    }
    
//    MARK: Collection View delegate
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: UIScreen.main.bounds.size.width / 2 - 12, height: UIScreen.main.bounds.size.width / 2 - 12)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        switch (indexPath as NSIndexPath).row
        {
            case 0:
                performSegue(withIdentifier: "SortSegue", sender: nil)
                break
            
            case 1:
                performSegue(withIdentifier: "RotatingSegue", sender: nil)
                break
            
            case 2:
                performSegue(withIdentifier: "NumbersSegue", sender: nil)
                break
            
            case 3:
                performSegue(withIdentifier: "GridSegue", sender: nil)
                break
            
            default:
                break
        }
    }
}

