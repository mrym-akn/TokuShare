//
//  DeleteUserView.swift
//  TokuShare
//
//  Created by cmStudent on 2023/02/17.
//

import SwiftUI

struct DeleteUserView: View {
    @StateObject var deleteUser = DeleteUser()
    @Environment(\.dismiss) var dismiss
    @State private var showAlert = false
    var body: some View {
        VStack{
            Text("アカウントを削除しますか?")
                .font(.title2)
                .padding(.bottom)
            HStack{
                Button{
                    deleteUser.tapDelete()
                    showAlert = true
                } label:{
                    Text("はい")
                        .font(.title2)
                        .foregroundColor(Color.red)
                        .padding(.trailing)
                }
                .alert("アカウントが削除されました", isPresented: $showAlert) {
                }message: {
                    Text("アプリを終了してください")
                }
                
                Button{
                    dismiss()
                } label:{
                    Text("いいえ")
                        .font(.title2)
                        .padding(.leading)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .navigationBarTitle(Text(NSLocalizedString("", comment: "")), displayMode: .inline)
    }
}

