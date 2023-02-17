//
//  PassCahnge.swift
//  TokuShare
//
//  Created by cmStudent on 2023/02/17.
//

import FirebaseAuth

class PassChange: ObservableObject{
    func passChange(email: String){
        Auth.auth().sendPasswordReset(withEmail: email){ error in
            print("パスワード変更")
        }
    }
}
