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
        setupNavBar()
    }
    
    func setupNavBar() {
           navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
           navigationController?.navigationBar.shadowImage = UIImage()
           navigationController?.navigationBar.tintColor = .white
       }


    @IBAction func logoutAction(_ sender: Any) {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error)
        }
    }
}

