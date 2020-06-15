//
//  ModelForSalons.swift
//  myFirstDatabase
//
//  Created by Артём Бацанов on 24.04.2020.
//  Copyright © 2020 Артём Бацанов. All rights reserved.
//

import Foundation

var Salons: [[String: Any]] {
    set{
        UserDefaults.standard.set(newValue, forKey: "SalonKey")
        UserDefaults.standard.synchronize()
    }
    get{
        if let array = UserDefaults.standard.array(forKey: "SalonKey") as? [[String: Any]]{
            return array
        }
        else{
            return []
        }
    }
}

func addItem(nameItem: String){
    Salons.append(["Name": nameItem])
}

func removeItem(at index: Int){
    Salons.remove(at: index)
}
