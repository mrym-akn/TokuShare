//
//  SearchPrice.swift
//  TokuShare
//
//  Created by cmStudent on 2023/02/15.
//

import SwiftUI
import FirebaseFirestore

class SearchPrice: ObservableObject{
    @Published var posts = [Post]()
    var post : Post?
    
    func fetchPriceData(priceNumber: Int){
        let posts = Firestore.firestore().collection("posts").whereField("price", isEqualTo: priceNumber)
        //価格検索
        //.whereField("shopName", isEqualTo: shop)//店舗名検索
        //.whereField("goodsName", isEqualTo: goods)//商品名検索
       
        
        
        
        posts
        .order(by: "timestamp", descending: false) //更新日時の新しい順
            .getDocuments { (querySnapshot, error) in
                if let error = error{
                    print(error.localizedDescription)
                    return
                }
                
                guard let snap = querySnapshot else { return }
                
                let documents = snap.documents
                
                for document in documents{
                    let id = document.documentID
                    guard let ownerUsername = document.get("ownerUsername") as? String,
                          let ownerUid = document.get("ownerUid") as? String,
                          let goodsName = document.get("goodsName") as? String,
                          let price = document.get("price") as? Int,
                          let shopName = document.get("shopName") as? String,
                          let comment = document.get("comment") as? String,
                          let likes = document.get("likes") as? Int,
                          let imageUrl = document.get("imageUrl") as? String,
                          let timeStamp = document.get("timestamp") as? Timestamp  else {
                        continue
                    }
                    
                    let date = timeStamp.dateValue()
                    let data = Post(id: id, ownerUid: ownerUid, imageUrl: imageUrl, ownerUsername: ownerUsername, goodsName: goodsName, price: price, shopName: shopName, comment: comment, likes: likes, date: date)
                    
                    self.posts.append(data)
                    
                }
            }
    }
}

