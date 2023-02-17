//
//  Post.swift
//  TokuShare
//
//  Created by cmStudent on 2023/02/15.
//

import Firebase
import FirebaseFirestoreSwift

struct Post: Identifiable{
    @DocumentID var id: String?
    var ownerUid: String
    let imageUrl: String
    var ownerUsername: String
    var goodsName: String
    var price: Int
    var shopName: String
    var comment: String
    var likes: Int
    var date: Date
    var dateString: String{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy年M月d日 H時m分"
        return formatter.string(from: date)
    }
}
