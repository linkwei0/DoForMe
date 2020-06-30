//
//  User.swift
//  myFirstDatabase
//
//  Created by Артём Бацанов on 26.06.2020.
//  Copyright © 2020 Артём Бацанов. All rights reserved.
//

import Foundation

class User {
    
    var name: String!
    var uid: String!
    
    init(dictionary: [String: Any]) {
        
        self.name = dictionary["name"] as? String ?? ""
        self.uid = dictionary["uid"] as? String ?? ""
        
    }
}
