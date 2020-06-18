//
//  File.swift
//  DoForMe
//
//  Created by Артём Бацанов on 08.06.2020.
//  Copyright © 2020 Артём Бацанов. All rights reserved.
//

import Foundation


var Services: [[String: Any]] {
    set{
        UserDefaults.standard.set(newValue, forKey: "ServiceKey")
        UserDefaults.standard.synchronize()
    }
    get{
        if let array = UserDefaults.standard.array(forKey: "ServiceKey") as? [[String: Any]]{
            return array
        }
        else{
            return []
        }
    }
}

func addItemServices(nameItem: String){
    Services.append(["Name": nameItem])
}

func removeItemServices(at index: Int){
    Services.remove(at: index)
}

func moveItem(fromIndex: Int, toIndex: Int){
    let from = Services[fromIndex]
    Services.remove(at: fromIndex)
    Services.insert(from, at: toIndex)
}
