//
//  GridCollectionViewCell.swift
//  CognitiveGames
//
//  Created by Apple on 3/25/16.
//  Copyright © 2016 Chaotic Neutral. All rights reserved.
//

import UIKit

class GridCollectionViewCell: UICollectionViewCell
{
    @IBOutlet weak var view: UIView!
        
    internal func configureCell()
    {
        view.layer.masksToBounds = false
        view.layer.shadowColor = UIColor.blackColor().CGColor
        view.layer.shadowOffset = CGSize(width: 4, height: 4)
        view.layer.shadowOpacity = 0.36
        view.layer.shadowRadius = 1.2
        view.layer.cornerRadius = (UIScreen.mainScreen().bounds.size.width / 4 - 10 - 16) / 2
        view.backgroundColor = UIColor.grayColor()
    }
}
