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
    
    var user: User?
    
    @IBOutlet weak var btnViewSalons: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBar()
        fetchCurrentUser()
    }
    @IBOutlet weak var lableWelcome: UILabel!
    
    
    func fetchCurrentUser() {
        Firestore.firestore().fetchCurrentUser { (user, err) in
            if err == nil {
                self.lableWelcome.text = (user?.name)!  + ", добро пожаловать в DoForMe!"
            }
            else {
                print(err?.localizedDescription as Any)
                return
            }
        }
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

