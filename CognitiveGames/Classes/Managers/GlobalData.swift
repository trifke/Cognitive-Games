//
//  GlobalData.swift
//  CognitiveGames
//
//  Created by Petar Trifunovic on 9/15/16.
//  Copyright © 2016 Chaotic Neutral. All rights reserved.
//

import UIKit

class GlobalData
{
    static let sharedInstance = GlobalData()
    
    var selectedUser = User()
    
    fileprivate init()
    {
        
    }

}
