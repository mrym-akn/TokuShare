//
//  PriceResult.swift
//  TokuShare
//
//  Created by cmStudent on 2023/02/15.
//

import SwiftUI
import Kingfisher

struct PriceResult: View {
   // @State var img = "heart"
    @State var likeComp = false
    @ObservedObject var viewModel = SearchPrice()
    @ObservedObject var likesData = LikesData()
    @State private var showAlert = false
    @State var alertText = ""
    
    init(priceNum: Int) {
        self.viewModel.fetchPriceData(priceNumber: priceNum)
    }
    
    var body: some View {
        ScrollView{
            ForEach(viewModel.posts){ post in
                VStack{
                    VStack {
                        HStack {
                            Text(post.ownerUsername)
                                .frame(alignment: .trailing)
                                .padding()
                            Spacer()
                            Text(post.shopName)
                                .frame(alignment: .leading)
                                .padding()
                        }
                        HStack {
                            Text(post.goodsName)
                                .frame(alignment: .trailing)
                                .padding()
                            Spacer()
                            Text("\(post.price)円")
                                .frame(alignment: .leading)
                                .padding()
                        }
                        // Image("smpl3")
                        KFImage(URL(string: post.imageUrl))
                            .resizable()
                            .frame(width: 350, height: 400, alignment: .center)
                        Text(post.comment)
                            .lineLimit(3)
                        
                        Divider()
                        HStack{
                            Text(post.dateString)
                                .frame(alignment: .trailing)
                                .padding()
                            Spacer()
                            HStack{
                                Text("\(alertText)")
                                    .foregroundColor(Color.pink)
                                    .frame(alignment: .leading)
                                Text("\(post.likes)")
                                    .frame(alignment: .leading)
                                Button{
                                    if likeComp == false{
                                        likeComp = true
                                        likesData.addLikes(like: post.likes, id: post.id!)
                                        alertText = "+1"
                                    } else if likeComp == true{
                                        likeComp = false
                                        likesData.unLikes(like: post.likes, id: post.id!)
                                        alertText = "-1"
                                    }
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                        alertText = ""
                                    }
                                   // showAlert = true
                                } label: {
                                    Image(systemName: "heart.fill")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                        .foregroundColor(Color.pink)
                                }
//                                .alert(isPresented: $showAlert){
//                                        Alert(title: Text("\(alertText)"))
//                                }
                            }.padding()
                        }
                        Divider()
                    }
                }//.navigationBarBackButtonHidden(true)
                //            }.onAppear(){
                //                self.viewModel.fetchData()
                //            }
            }
        }
    }
}
