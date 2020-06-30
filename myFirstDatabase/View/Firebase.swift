//
//  Firebase.swift
//  myFirstDatabase
//
//  Created by Артём Бацанов on 26.06.2020.
//  Copyright © 2020 Артём Бацанов. All rights reserved.
//

import Foundation
import Firebase

extension Firestore{
    
    func fetchCurrentUser(completion: @escaping (User?, Error?) -> ()) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        Firestore.firestore().collection("users").document(uid).getDocument { (snapshot, err) in
            if let err = err {
                completion(nil, err)
                return
            }
            
            guard let dictionary = snapshot?.data() else { return }
                let user = User(dictionary: dictionary)
                completion(user, nil)
        }
    }
//    func fetchCurrentSalon(completion: @escaping (Salon?, Error?) -> ()) {
//        guard let uid = Auth.auth().currentUser?.uid else { return }
//
//        Firestore.firestore().collection("salons").document(uid).getDocument { (snapshot, err) in
//            if let err = err {
//                completion(nil, err)
//                return
//            }
//
//            guard let dictionary = snapshot?.data() else { return }
//                let salon = Salon(dictionary: dictionary)
//                completion(salon, nil)
//        }
//    }
}
