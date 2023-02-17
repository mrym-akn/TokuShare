//
//  Login.swift
//  TokuShare
//
//  Created by cmStudent on 2023/02/15.
//

import Firebase
import SwiftUI
import FirebaseAuth
import FirebaseFirestore


class Login: ObservableObject{
    @Published var name = ""
    @Published var password = ""
    @Published var email = ""
    @Published var isActive:Bool = false
    
    @Published var currentUser: User?
    @Published var userSession = Auth.auth().currentUser
    
    static let shared = Login()
    
    //let user = Auth.auth().currentUser
    // private var db = Firestore.firestore()
    
    init(){
        fetchUser()
    }
    
    
    
    func entry(){
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let user = result?.user{
                let request = user.createProfileChangeRequest()
                request.displayName = self.name
                request.commitChanges { error in
                    user.sendEmailVerification() { error in
                        if error == nil{
                            print("仮登録")
                            let data = ["email": self.email,
                                        "username": self.name,
                                        "uid": user.uid]
                            
                            Firestore.firestore().collection("users").document(user.uid).setData(data){ _ in
                                print("ユーザー登録完了")
                                self.userSession = user
                                self.fetchUser()
                            }
                        } 
                    }
                }
            }
        }
    }
    
    
    
    func tapLogin(){
        Auth.auth().signIn(withEmail: email, password: password){ result, error in
            if error != nil{
                print("ログインできませんでした")
                self.isActive = false
                return
            }
            
            guard let user = result?.user else { return }
            self.isActive = true
            self.userSession = user
            self.fetchUser()
            
        }
    }
    

//    func logout(){
//        isActive = true
//        self.userSession = nil
//        try? Auth.auth().signOut()
//    }
    
    func fetchUser(){
        guard let uid = userSession?.uid else {return}
        Firestore.firestore().collection("users").document(uid).getDocument { snapshot, _ in
            guard let user = try? snapshot?.data(as: User.self) else {return}
            self.currentUser = user
            print("DEBUG: 現在のユーザーは \(user) です")
        }
    }
}

