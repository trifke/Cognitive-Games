//
//  NumbersCollectionViewCell.swift
//  CognitiveGames
//
//  Created by Apple on 3/24/16.
//  Copyright © 2016 Chaotic Neutral. All rights reserved.
//

import UIKit

class NumbersCollectionViewCell: UICollectionViewCell
{
    @IBOutlet weak var view: UIView!
    
    @IBOutlet weak var labelNumber: UILabel!
    
    internal func configureCell()
    {
        view.layer.masksToBounds = false
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 4, height: 4)
        view.layer.shadowOpacity = 0.36
        view.layer.shadowRadius = 1.2
        view.layer.cornerRadius = 8.0
        view.backgroundColor = UIColor.gray
    }
    
}
