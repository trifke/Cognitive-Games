//
//  User.swift
//  CognitiveGames
//
//  Created by Apple on 4/8/16.
//  Copyright © 2016 Chaotic Neutral. All rights reserved.
//

import Foundation
import RealmSwift

class User: Object
{
    dynamic var id = UUID().uuidString
    dynamic var name = ""
    dynamic var age = 0
    
    override static func primaryKey() -> String?
    {
        return "id"
    }
    
// Specify properties to ignore (Realm won't persist these)
    
//  override static func ignoredProperties() -> [String] {
//    return []
//  }
}
