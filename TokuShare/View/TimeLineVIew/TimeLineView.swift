//
//  TimeLineView.swift
//  TokuShare
//
//  Created by cmStudent on 2023/02/15.
//

import SwiftUI

struct TimeLineView: View {
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    TLItem()
                    HStack{
                    NavigationLink(destination: SearchView()) {
                        HStack {
                            Image(systemName: "chevron.right")
                                .foregroundColor(.white)
                            Text("項目検索")
                                .foregroundColor(.white)
                        }.padding()
                        Spacer()
                    }.background(Color(.systemCyan))
                    //↑項目で検索
                    NavigationLink(destination: SearchAllView()) {
                        HStack {
                            Image(systemName: "chevron.right")
                                .foregroundColor(.white)
                            Text("詳細検索")
                                .foregroundColor(.white)
                        }.padding()
                        Spacer()
                    }.background(Color(.systemBlue))
                    //↑全条件で検索
                    }
                }
            }
        }
        //ipadで左に寄って画面外に消えるため全画面表示
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle(Text(NSLocalizedString("", comment: "")), displayMode: .inline)
        
    }
}

//struct TimeLineView_Previews: PreviewProvider {
//    static var previews: some View {
//        TimeLineView()
//    }
//}
