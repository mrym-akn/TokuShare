//
//  TokuShareApp.swift
//  TokuShare
//
//  Created by cmStudent on 2023/02/02.
//

import SwiftUI
import FirebaseCore
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        return true
    }
}


@main
struct TokuShareApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            if Auth.auth().currentUser != nil {
                        MainTab()  // メイン画面
                    } else {
                        LoginView() // ログイン画面
                    }
        }
    }
}
