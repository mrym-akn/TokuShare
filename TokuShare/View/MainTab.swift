//
//  MainTab.swift
//  TokuShare
//
//  Created by cmStudent on 2023/02/15.
//

import SwiftUI

struct MainTab: View {
    @State var page : Int? = 0
    @ObservedObject var logout = LogOut()
    @State private var showAlert = false
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
       // NavigationView{
            ZStack{
                TabView {
                    TimeLineView()
                        .tabItem {
                            Image(systemName: "magnifyingglass")
                            Text("検索")
                        }
                    
                    UpLoadView()
                        .tabItem {
                            Image(systemName: "square.and.arrow.up")
                            Text("投稿")
                        }
                    
                    MyPageView()
                        .tabItem {
                            Image(systemName: "person")
                            Text("マイページ")
                        }
                }
                VStack{
                    HStack{
                        Spacer()
                        Button{
                           // self.page = 1
                            showAlert = true
                        } label: {
                            Text("ログアウト")
                                .foregroundColor(Color.red)
                                .padding()
                        }.alert("ログアウトしますか？",isPresented: $showAlert){

                            Button("はい"){
                                logout.logout()
                            }
                            Button("いいえ"){

                            }
                        }
                    }
                    Spacer()
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
            .navigationBarTitle(Text(NSLocalizedString("", comment: "")), displayMode: .inline)}
      //  .navigationViewStyle(StackNavigationViewStyle())
    }

