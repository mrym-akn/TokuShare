//
//  UpLoadView.swift
//  TokuShare
//
//  Created by cmStudent on 2023/02/15.
//

import SwiftUI

struct UpLoadView: View {
    //    @State var page : Int? = 0
    @State private var showAlert = false
    @State var imagePickerPresented = false
    
    @State var postImage: Image?
    @State private var selectedImage: UIImage?
    
    @ObservedObject var viewModel = UploadViewModel()
    
    @State var commentText = ""
    @State var goodsText = ""
    @State var shopText = ""
    @State var priceInt = 0
    
    var body: some View {
        ScrollView{
            VStack(spacing: 5){
                HStack{
                    Text("レシートの写真")
                    //       .padding(.leading)
                        .font(.title3)
                    Text("(必須)")
                        .foregroundColor(Color.red)
                        .font(.title3)
                    Spacer()
                }.padding(.top)
                if postImage == nil {
                    Button(action: { imagePickerPresented.toggle() }, label: {
                        Text("写真を追加する")
                            .foregroundColor(Color.blue)
                            .font(.title3)
                            .padding()
                        
                    }).sheet(isPresented: $imagePickerPresented, onDismiss: loadImage, content: {
                        ImagePicker(image: $selectedImage)
                    })
                }else if let image = postImage {
                    Button(action: { imagePickerPresented.toggle() }, label: {
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 180, height: 180)
                            .clipped()
                            .padding()
                    }).sheet(isPresented: $imagePickerPresented, onDismiss: loadImage, content: {
                        ImagePicker(image: $selectedImage)
                    })
                }
                
                Group{
                    HStack{
                        Text("商品名")
                        //       .padding(.leading)
                            .font(.title3)
                        Text("(必須)")
                            .foregroundColor(Color.red)
                            .font(.title3)
                        Spacer()
                    }
                    TextField(" 商品名を入力", text: $goodsText)
                        .frame(height: 50)
                        .overlay(RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.gray,lineWidth: 1))
                        .padding(.bottom)
                }
                
                Group{
                    HStack{
                        Text("価格")
                        //    .padding(.leading)
                            .font(.title3)
                        Text("(必須)")
                            .foregroundColor(Color.red)
                            .font(.title3)
                        Spacer()
                    }
                    TextField(" 価格を入力", value: $priceInt, format: .number)
                        .keyboardType(.numberPad)
                        .frame(height: 50)
                        .overlay(RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.gray,lineWidth: 1))
                        .padding(.bottom)
                }
                
                Group{
                    HStack{
                        Text("店舗名")
                        //    .padding(.leading)
                            .font(.title3)
                        Text("(必須)")
                            .foregroundColor(Color.red)
                            .font(.title3)
                        Spacer()
                    }
                    TextField(" 店舗名を入力", text: $shopText)
                        .frame(height: 50)
                        .overlay(RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.gray,lineWidth: 1))
                        .padding(.bottom)
                }
                
                Group{
                    HStack{
                        Text("商品に関するコメント")
                        //    .padding(.leading)
                            .font(.title3)
                        Text("(任意)")
                            .font(.title3)
                        Spacer()
                    }
                    ZStack{
                        TextField("商品に関するコメント",text: $commentText)
                            .frame(height: 50)
                            .overlay(RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.gray,lineWidth: 1))
                            .padding(.bottom)
                    }
                }
                Group{
                    Button {
                        if (goodsText == "" || shopText == "")||(priceInt == 0 || goodsText == ""){
                            print("投稿できない")
                        } else if(goodsText == "" && shopText == "")&&(priceInt == 0 && goodsText == ""){
                            print("投稿できない")
                        } else {
                            if let image = selectedImage{
                                viewModel.upload(comment: commentText, image: image, goodsName: goodsText, price: priceInt, shopName: shopText) { _ in
                                    commentText = ""
                                    postImage = nil
                                    goodsText = ""
                                    priceInt = 0
                                    shopText = ""
                                }
                            }
                            self.showAlert = true //投稿できる状態の時だけ
                        }
                    } label: {
                        Text("投稿")
                            .font(.title2)
                            .padding(.bottom)
                    }
                    .alert("投稿しますか？",isPresented: $showAlert){
                        Button("はい"){
                            if let image = selectedImage{
                                viewModel.upload(comment: commentText, image: image, goodsName: goodsText, price: priceInt, shopName: shopText) { _ in
                                    commentText = ""
                                    postImage = nil
                                    goodsText = ""
                                    priceInt = 0
                                    shopText = ""
                                }//2回投稿処理をしないと投稿されないため2回実行
                            }
                        }
                        Button("いいえ"){
                            
                        }
                    }
                }
            }.navigationViewStyle(StackNavigationViewStyle())
                .navigationBarBackButtonHidden(true)
                .navigationBarTitle(Text(NSLocalizedString("", comment: "")), displayMode: .inline)
                .navigationBarHidden(true)
        }.padding()
    }
}

extension UpLoadView {
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        postImage = Image(uiImage: selectedImage)
    }
}
