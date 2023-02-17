//
//  MyPageViewItem.swift
//  TokuShare
//
//  Created by cmStudent on 2023/02/15.
//

import SwiftUI
//import Firebase
//import FirebaseAuth

struct MyPageViewItem: View {
    @State var page : Int? = 0
    @State private var showAlert = false
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel = Login()
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading){
                Text("マイページ")
                    .font(.title2)
                    .padding(.bottom)
                HStack{
                    Text("ユーザーネーム:")
                        .font(.title2)
                    Text(viewModel.currentUser?.username ?? "")
                        .font(.title2)
                    Spacer()
                }
                HStack{
                    Text("メールアドレス:")
                    Text(viewModel.currentUser?.email ?? "")
                    Spacer()
                }
                Divider()
                Group{
                    NavigationLink(destination: PassChangeView()) {
                        Text("パスワードの変更")
                            .font(.title3)
                            .padding(.top)
                            .padding(.bottom)
                    }
                    Divider()
                }
                
                Group{
                    NavigationLink(destination: NewNameView()) {
                        Text("ユーザー名の変更")
                            .font(.title3)
                            .padding(.top)
                            .padding(.bottom)
                    }
                    Divider()
                }
                Group{
                    NavigationLink(destination: DeleteUserView()) {
                        Text("アカウント削除")
                            .font(.title3)
                            .padding(.top)
                            .padding(.bottom)
                            .foregroundColor(Color.red)
                    }
//                    Button{
//                        showAlert = true
//                    } label: {
//                        Text("アカウント削除")
//                            .font(.title3)
//                            .padding(.top)
//                            .padding(.bottom)
//                            .foregroundColor(Color.red)
//                    }
//                    .alert("アカウント削除しますか？",isPresented: $showAlert){
//                        Button("はい"){
//                            viewModel.tapDelete()
//                        }
//
//                        Button("いいえ"){
//
//                        }
//                    }
                    Divider()
                }
                Spacer()
            }
        }.navigationBarBackButtonHidden(true)
    }
}
