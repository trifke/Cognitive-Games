//
//  MainCollectionViewCell.swift
//  CognitiveGames
//
//  Created by Apple on 12/22/15.
//  Copyright © 2015 Chaotic Neutral. All rights reserved.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell
{
    @IBOutlet weak var labelTitle: UILabel!
    
    @IBOutlet weak var labelDescription: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    internal func configureCell(_ row: Int)
    {
        switch (row)
        {
            case 0:
                labelTitle.text = "Sort"
                labelDescription.text = "Out of order"
                imageView.image = UIImage(named: "sort")
                break
                
            case 1:
                labelTitle.text = "Rotating"
                labelDescription.text = "Circle of Joy"
                imageView.image = UIImage(named: "rotating")
                break
                
            case 2:
                labelTitle.text = "Numbers"
                labelDescription.text = "Reverse sequence"
                imageView.image = UIImage(named: "numbers")
                break
                
            case 3:
                labelTitle.text = "Grid"
                labelDescription.text = "4x4 Power"
                imageView.image = UIImage(named: "grid")
                break
                
            default:
                break
        }
    }
}
