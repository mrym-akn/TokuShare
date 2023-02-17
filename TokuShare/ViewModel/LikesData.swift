//
//  LikesData.swift
//  TokuShare
//
//  Created by cmStudent on 2023/02/16.
//

import SwiftUI
import FirebaseFirestore

class LikesData: ObservableObject{
    
    
    func addLikes(like: Int, id: String){
        print("like = \(like)")
        let likeCount = like + 1
        Firestore.firestore().collection("posts").document(id).updateData(["likes": likeCount]){ error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("更新成功")
            }
        }
    }
    
    func unLikes(like: Int, id: String){
        print("like = \(like)")
        let likes = like
        let likeCount = like - 1
        if likes == 0{
            //マイナスになるから何もしない
            print("なぜか0から-1できちゃった")
        } else{
            Firestore.firestore().collection("posts").document(id).updateData(["likes": likeCount]){ error in
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    print("更新成功")
                }
            }
        }
    }
}
