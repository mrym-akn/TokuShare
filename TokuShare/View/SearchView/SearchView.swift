//
//  SearchView.swift
//  TokuShare
//
//  Created by cmStudent on 2023/02/15.
//

import SwiftUI

struct SearchView: View {
    @Environment(\.dismiss) var dismiss
    @State var searchGoodsText = ""
    @State var searchShopText = ""
    @State var searchShopNumber = 0
    
    @State var selectValue = 0
    
//    @StateObject var searchGoods = SearchGoods()
//    @StateObject var searchShop = SearchShop()
//    @StateObject var searchPrice = SearchPrice()
    
    @State var resultDisplay = false
    
    @State private var showAlert = false
    @State var searchON = false
    
    var body: some View {
        VStack {
            Picker("検索内容を選択", selection: $selectValue) {
                Text("商品名").tag(1)
                Text("価格").tag(2)
                Text("店舗名").tag(3)
            }.pickerStyle(SegmentedPickerStyle())
                .padding(.top)
            
            if selectValue == 0{
                //何もない
            }else if selectValue == 1{
                //商品名検索
                HStack{
                    Text("商品名")
                        .font(.title3)
                    //  .padding(.leading)
                    Spacer()
                }
                TextField("商品名を入力", text: $searchGoodsText)
                    .frame(height: 50)
                    .overlay(RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.gray,lineWidth: 1))
            } else if selectValue == 2{
                //価格検索
                HStack{
                    Text("価格")
                        .font(.title3)
                    //  .padding(.leading)
                    Spacer()
                }
                TextField(" 希望の価格を入力", value: $searchShopNumber,format: .number)
                    .frame(height: 50)
                    .overlay(RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.gray,lineWidth: 1))
                    .keyboardType(.numberPad)
                
            } else {
                //店舗名検索
                HStack{
                    Text("店舗名")
                        .font(.title3)
                    //  .padding(.leading)
                    Spacer()
                }
                TextField(" 店舗名を入力", text: $searchShopText)
                    .frame(height: 50)
                    .overlay(RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.gray,lineWidth: 1))
            }
            Group{
                HStack{
                    Button{
                        resultDisplay = true
                        searchON = true
                        if selectValue == 0{
                            self.showAlert = true
                        }
                        
                    } label: {
                        Text("検索")
                            .font(.title2)
                            .padding(.trailing)
                    }
                    .alert("検索したい項目を選んでください",isPresented: $showAlert){
                        Button("戻る"){
                           
                        }
                    }
                    
                    Button{
                        resultDisplay = false
                        dismiss()
                    } label: {
                        Text("戻る")
                            .font(.title2)
                            .padding(.leading)
                    }
                }.padding(.bottom)
            }
            
            Group{
                if searchON == true{
                    if selectValue == 0{
                        Text("検索したい項目を選んでください")
                    } else if selectValue == 1{
                        GoodsResult(goodsString: searchGoodsText)
                    } else if selectValue == 2{
                        PriceResult(priceNum: searchShopNumber)
                    } else if selectValue == 3{
                        ShopResult(shopString: searchShopText)
                    }
                }
            }
        }//.padding()
        //ipadで左に寄って画面外に消えるため全画面表示
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle(Text(NSLocalizedString("", comment: "")), displayMode: .inline)
    }
}


//struct SearchView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchView()
//    }
//}
