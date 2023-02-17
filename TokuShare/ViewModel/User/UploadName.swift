//
//  UploadName.swift
//  TokuShare
//
//  Created by cmStudent on 2023/02/17.
//

import SwiftUI
import FirebaseFirestore
import FirebaseAuth

class UploadName: ObservableObject {
    func uploadName(newName: String){
        let userSession = Auth.auth().currentUser
        Firestore.firestore().collection("users").document(userSession!.uid).updateData(["username": newName]){ error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("更新成功")
            }
        }
    }
    
}
