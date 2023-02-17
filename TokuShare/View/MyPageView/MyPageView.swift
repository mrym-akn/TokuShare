//
//  MyPageView.swift
//  TokuShare
//
//  Created by cmStudent on 2023/02/15.
//

import SwiftUI

struct MyPageView: View {
    var body: some View {
        VStack(alignment: .leading) {
            MyPageViewItem()
                .padding()
        }.navigationViewStyle(StackNavigationViewStyle())
            .navigationBarBackButtonHidden(true)
            .navigationBarTitle(Text(NSLocalizedString("", comment: "")), displayMode: .inline)
            .navigationBarHidden(true)
    }
}
