//
//  LoginViewItem.swift
//  TokuShare
//
//  Created by cmStudent on 2023/02/15.
//

import SwiftUI

import SwiftUI

struct LoginViewItem: View {
    @State var page : Int? = 0
    @ObservedObject var login = Login()
    @State var selectedIndex = 0
    
    var body: some View {
        NavigationView{
            VStack{
                Image("title_tokushare")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .padding()
                HStack{
                    Text("メールアドレス")
                        .font(.title3)
                    //  .padding(.leading)
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
                    Text("パスワード")
                        .font(.title3)
                    // .padding(.leading)
                    Text("(必須)")
                        .foregroundColor(Color.red)
                        .font(.title3)
                    Spacer()
                }
                VStack{
                    SecureField(" パスワードを入力", text: $login.password)
                        .frame(height: 50)
                        .overlay(RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.gray,lineWidth: 1))
                    HStack{
                        NavigationLink(destination: PassChangeView()) {
                            Text("パスワードを忘れた方はこちら")
                                .font(.body)
                                .padding(.bottom)
                            //  .padding(.leading)
                        }
                        Spacer()
                    }
                }
                
                NavigationLink(destination: MainTab(),tag: 1,selection: $page) {
                    
                }
                
                Button{
                    if login.password == "" || login.email == ""{
                        
                    } else if login.password == "" && login.email == ""{
                        
                    } else {
                        login.tapLogin()
                        self.page = 1
                    }
                } label: {
                    Text("ログイン")
                        .font(.title3)
                }.padding(.bottom)
                
                NavigationLink(destination: NewUserView()) {
                    Text("新規ユーザー登録")
                        .font(.title3)
                }.padding(.bottom)
                
                
            }.padding()
        }.navigationViewStyle(StackNavigationViewStyle())
            .navigationBarBackButtonHidden(true)
            .navigationBarTitle(Text(NSLocalizedString("", comment: "")), displayMode: .inline)
            .navigationBarHidden(true)
        
    }
}
