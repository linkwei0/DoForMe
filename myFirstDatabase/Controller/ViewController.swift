//
//  ViewController.swift
//  myFirstDatabase
//
//  Created by Артём Бацанов on 10.04.2020.
//  Copyright © 2020 Артём Бацанов. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var btnViewSalons: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


    @IBAction func logoutAction(_ sender: Any) {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error)
        }
    }
}

