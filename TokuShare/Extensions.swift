//
//  Extensions.swift
//  TokuShare
//
//  Created by cmStudent on 2023/02/15.
//

import UIKit

extension UIApplication{
    func  endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
