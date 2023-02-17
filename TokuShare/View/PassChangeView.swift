//
//  PassChange.swift
//  TokuShare
//
//  Created by cmStudent on 2023/02/15.
//

import SwiftUI

struct PassChangeView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var passChange = PassChange()
    @State private var showAlert = false
    @State var emailText = ""
    var body: some View {
        VStack{
            HStack{
                Text("パスワード変更")
                    .font(.title)
                    .padding(.bottom)
                Spacer()
            }
            HStack{
                Text("メールアドレス")
                    .font(.title3)
                //  .padding(.leading)
                Text("(必須)")
                    .foregroundColor(Color.red)
                    .font(.title3)
                Spacer()
            }
            TextField(" メールアドレスを入力", text: $emailText)
                .frame(height: 50)
                .overlay(RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.gray,lineWidth: 1))
                .padding(.bottom)
            
            Button{
                passChange.passChange(email: emailText)
                self.showAlert = true
            } label: {
                Text("変更")
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
        }
        .padding()
        .navigationBarBackButtonHidden(true)
    }
}
