//
//  ImageUploader.swift
//  TokuShare
//
//  Created by cmStudent on 2023/02/15.
//

import UIKit
import Firebase
import FirebaseStorage

enum UploadType{
   case post
    
    var filePath: StorageReference{
        let filename = NSUUID().uuidString
        switch self{
        case .post:
            return Storage.storage().reference(withPath: "/\(filename)")
        }
    }
}

struct ImageUploader {
    static func uploadImage(image: UIImage, type: UploadType, completion: @escaping(String) -> Void){
        guard let imageData = image.jpegData(compressionQuality: 0.5) else {return}
        let ref = type.filePath
        
        ref.putData(imageData, metadata: nil){ _, error in
            if let error = error{
                print("DEBUG* 画像の投稿に失敗しました。 \(error.localizedDescription)")
                return
            }
            
            print("画像投稿成功")
            
            ref.downloadURL { url, _ in
                guard let imageUrl = url?.absoluteString else {return}
                completion(imageUrl)
            }
        }
    }
}
