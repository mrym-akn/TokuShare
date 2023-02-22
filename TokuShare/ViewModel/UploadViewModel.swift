//
//  UploadViewModel.swift
//  TokuShare
//
//  Created by cmStudent on 2023/02/15.
//

import SwiftUI
import Firebase

class UploadViewModel: ObservableObject{
    
    func upload(comment: String,image: UIImage,goodsName: String,price: Int,shopName: String, completion: FirestoreCompletion){
        guard let user = Login.shared.currentUser else {return}
        ImageUploader.uploadImage(image: image, type: .post) { imageUrl in
            let data = ["comment": comment,
                        "goodsName": goodsName,
                        "price": price,
                        "shopName": shopName,
                        "timestamp": Timestamp(date: Date()),
                        "likes":0,
                        "imageUrl": imageUrl,
                        "ownerUid" : user.id ?? "",
                        "ownerUsername": user.username] as [String: Any]
            
            Firestore.firestore().collection("posts").addDocument(data: data, completion: completion)
            print("投稿成功: \(data)")
        }
    }
}
