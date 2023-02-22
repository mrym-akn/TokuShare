//
//  LogOut.swift
//  TokuShare
//
//  Created by cmStudent on 2023/02/17.
//

import FirebaseAuth
import FirebaseFirestore

class Logout: ObservableObject{
    var isActive:Bool = false
    var userSession = Auth.auth().currentUser
    
    func logout(){
        isActive = true
        userSession = nil
        try? Auth.auth().signOut()
    }
}
