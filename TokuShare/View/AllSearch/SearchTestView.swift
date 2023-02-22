//
//  SearchAllView.swift
//  TokuShare
//
//  Created by cmStudent on 2023/02/21.
//

import SwiftUI

struct SearchAllView: View {
    @Environment(\.dismiss) var dismiss
    @State var searchGoodsText = ""
    @State var searchShopText = ""
    @State var searchPriceNumber = 0
    
    @State var openBox = true
    @State var openBoxText = "閉じる"
    
    //@State var selectValue = 0
    
    //    @StateObject var searchGoods = SearchGoods()
    //    @StateObject var searchShop = SearchShop()
    //    @StateObject var searchPrice = SearchPrice()
    
    //@State var resultDisplay = false
    
    //    @State private var showAlert = false
    //    @State var searchON = false
    
    var body: some View {
        VStack {
            if openBox == false{
                //閉じる状態
            } else if openBox == true{
                VStack{
                    //商品名検索
                    HStack{
                        Text("商品名")
                            .font(.title3)
                        //  .padding(.leading)
                        Spacer()
                    }
                    TextField("商品名を入力", text: $searchGoodsText)
                        .frame(height: 40)
                        .overlay(RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.gray,lineWidth: 1))
                    //価格検索
                    HStack{
                        Text("価格")
                            .font(.title3)
                        //  .padding(.leading)
                        Spacer()
                    }
                    TextField(" 希望の価格を入力", value: $searchPriceNumber,format: .number)
                        .frame(height: 40)
                        .overlay(RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.gray,lineWidth: 1))
                        .keyboardType(.numberPad)
                    //店舗名検索
                    HStack{
                        Text("店舗名")
                            .font(.title3)
                        //  .padding(.leading)
                        Spacer()
                    }
                    TextField(" 店舗名を入力", text: $searchShopText)
                        .frame(height: 40)
                        .overlay(RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.gray,lineWidth: 1))
                }.padding()
            }
            HStack{
                Button{
                    dismiss()
                } label: {
                    Text("戻る")
                        .font(.title3)
                        .padding(.trailing)
                }
                Button{
                    if openBox == true{
                        openBox = false
                        openBoxText = "開く　"
                    } else if openBox == false{
                        openBox = true
                        openBoxText = "閉じる"
                    }
                } label: {
                    Text("\(openBoxText)")
                        .font(.title3)
                        .padding(.leading)
                }
            }
            AllResult(goodsString: searchGoodsText, shopString: searchShopText, priceInt: searchPriceNumber)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle(Text(NSLocalizedString("", comment: "")), displayMode: .inline)
    }
}

