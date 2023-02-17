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
                    NavigationLink(destination: SearchView()) {
                        HStack {
                            Image(systemName: "chevron.right")
                                .foregroundColor(.white)
                            Text("検索")
                                .foregroundColor(.white)
                        }.padding()
                        Spacer()
                    }.background(Color(.systemBlue))
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
