//
//  User.swift
//  TokuShare
//
//  Created by cmStudent on 2023/02/15.
//

import Firebase
import FirebaseFirestoreSwift

struct User: Identifiable,Decodable{
    //var id: String = UUID().uuidString
    @DocumentID var id: String?
    //var uid: String
    var username: String
    var email: String
    
    var isCurrentUser: Bool { return Login.shared.userSession?.uid == id }
}
