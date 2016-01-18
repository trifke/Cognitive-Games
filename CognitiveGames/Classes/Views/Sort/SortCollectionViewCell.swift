//
//  SortCollectionViewCell.swift
//  CognitiveGames
//
//  Created by Apple on 12/22/15.
//  Copyright © 2015 Chaotic Neutral. All rights reserved.
//

import UIKit

class SortCollectionViewCell: UICollectionViewCell
{
    @IBOutlet weak var view: UIView!
    
    @IBOutlet weak var labelNumber: UILabel!
    
    internal func configureCell()
    {
        self.view.layer.masksToBounds = false
        self.view.layer.shadowColor = UIColor.blackColor().CGColor
        self.view.layer.shadowOffset = CGSize(width: 4, height: 4)
        self.view.layer.shadowOpacity = 0.36
        self.view.layer.shadowRadius = 1.2
        self.view.layer.cornerRadius = 8.0
        self.view.backgroundColor = UIColor.whiteColor()
        
        self.labelNumber.hidden = true
    }
}