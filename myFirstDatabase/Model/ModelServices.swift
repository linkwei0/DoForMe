//
//  File.swift
//  DoForMe
//
//  Created by Артём Бацанов on 08.06.2020.
//  Copyright © 2020 Артём Бацанов. All rights reserved.
//

import Foundation

var Services = [String]()

func addItemServices(nameItem: String){
    Services.append(nameItem)
}

func removeItemServices(at index: Int){
    Services.remove(at: index)
}

func moveItem(fromIndex: Int, toIndex: Int){
    let from = Services[fromIndex]
    Services.remove(at: fromIndex)
    Services.insert(from, at: toIndex)
}
