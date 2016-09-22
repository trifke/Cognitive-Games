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
        view.layer.masksToBounds = false
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 4, height: 4)
        view.layer.shadowOpacity = 0.36
        view.layer.shadowRadius = 1.2
        view.layer.cornerRadius = 8.0
        view.backgroundColor = UIColor.gray
        
        labelNumber.isHidden = true
    }

}
