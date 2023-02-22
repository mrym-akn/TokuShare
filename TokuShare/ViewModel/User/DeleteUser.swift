//
//  DeleteUser.swift
//  TokuShare
//
//  Created by cmStudent on 2023/02/17.
//

import FirebaseAuth
import FirebaseFirestore

class DeleteUser: ObservableObject{
    func tapDelete(){
        let userSession = Auth.auth().currentUser
        Firestore.firestore().collection("users").document(userSession!.uid).delete{ error in
            if error != nil {
                print("firestore側データが削除できてません")
            } else {
                print("退会完了(firestore)")
                userSession?.delete(){ error in
                    if error != nil{
                        print("Auth側データが削除できてません")
                    } else{
                        print("退会完了(auth)")
                    }
                }
            }
        }
    }
}
