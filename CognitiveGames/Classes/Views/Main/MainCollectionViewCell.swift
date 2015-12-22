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
    
    internal func configureCell(row: Int)
    {
        switch (row)
        {
        case 0:
            self.labelTitle.text = "Sort"
            self.labelDescription.text = "Out of order"
            break
            
        case 1:
            self.labelTitle.text = "Hiiden"
            self.labelDescription.text = "Gone and backwards"
            break
            
        case 2:
            self.labelTitle.text = "Numbers"
            self.labelDescription.text = "Reverse sequence"
            break
            
        case 3:
            self.labelTitle.text = "Grid"
            self.labelDescription.text = "4x4 Power"
            break
            
        default:
            break
        }
    }
}