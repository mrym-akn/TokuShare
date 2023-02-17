//
//  NewUserView.swift
//  TokuShare
//
//  Created by cmStudent on 2023/02/15.
//

import SwiftUI
//import FirebaseAuth

struct NewUserView: View {
    @ObservedObject var login = Login()
    @Environment(\.dismiss) var dismiss
    @State private var showAlert = false
    
    var body: some View {
        VStack{
            HStack{
                Text("新規ユーザー登録")
                    .font(.title)
                    .padding(.bottom)
                Spacer()
            }
            HStack{
                Text("メールアドレス")
                    .font(.title3)
                 //   .padding(.leading)
                Text("(必須)")
                    .foregroundColor(Color.red)
                    .font(.title3)
                Spacer()
            }
            TextField(" メールアドレスを入力", text: $login.email)
                .frame(height: 50)
                .overlay(RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.gray,lineWidth: 1))
                .padding(.bottom)
            
            HStack{
                Text("ユーザー名")
                    .font(.title3)
                  //  .padding(.leading)
                Text("(必須)")
                    .foregroundColor(Color.red)
                    .font(.title3)
                Spacer()
            }
            TextField(" ユーザー名を入力", text: $login.name)
                .frame(height: 50)
                .overlay(RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.gray,lineWidth: 1))
                .padding(.bottom)
            
            
            HStack{
                Text("パスワード設定")
                    .font(.title3)
                    //.padding(.leading)
                Text("(必須)")
                    .foregroundColor(Color.red)
                    .font(.title3)
                Spacer()
            }
            TextField(" パスワードを入力", text: $login.password)
                .frame(height: 50)
                .overlay(RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.gray,lineWidth: 1))
            
            
            Button{
                login.entry()
                showAlert = true
            } label: {
                Text("登録")
                    .font(.title2)
                    .padding()
            }
            .alert("入力されたメールアドレス向けにメールを送信しました",isPresented: $showAlert){
                Button("戻る"){
                    dismiss()
                }
            }
            
            Button{
                dismiss()
            } label: {
                Text("キャンセル")
                    .font(.title2)
                    .padding()
            }
        }.padding()
            .navigationBarBackButtonHidden(true)
    }
}
