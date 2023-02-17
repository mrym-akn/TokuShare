//
//  NewNameView.swift
//  TokuShare
//
//  Created by cmStudent on 2023/02/16.
//

import SwiftUI

struct NewNameView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var upLoadName = UploadName()
    @State var newUserName = ""
    @State private var showAlert = false
    var body: some View {
        VStack{
            HStack{
                Text("ユーザー名変更")
                    .font(.title)
                    .padding(.bottom)
                Spacer()
            }
            HStack{
                Text("新規ユーザー名")
                    .font(.title3)
                //  .padding(.leading)
                Text("(必須)")
                    .foregroundColor(Color.red)
                    .font(.title3)
                Spacer()
            }
            TextField(" 新規ユーザー名を入力", text: $newUserName)
                .frame(height: 50)
                .overlay(RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.gray,lineWidth: 1))
                .padding(.bottom)
            
            Button{
                upLoadName.uploadName(newName: newUserName)
                self.showAlert = true
            } label: {
                Text("変更")
                    .font(.title2)
                    .padding()
            }
            .alert("変更しました",isPresented: $showAlert){
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
