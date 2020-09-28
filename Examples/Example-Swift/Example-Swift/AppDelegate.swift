//
//  AppDelegate.swift
//  Example-Swift
//
//  Created by Samed Düzçay on 22/09/2020.
//  Copyright © 2020 Infoset Teknoloji A.S. All rights reserved.
//

import UIKit
import Infoset

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, InfosetChatDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        InfosetChat.apiKey = "your_api_key" // Set your API key
        InfosetChat.iosKey = "your_ios_key" // Set your iOS key
        
        InfosetChat.delegate = self
        
        return true
    }
    
    // MARK: InfosetChatDelegate
    
    func received(message: InfosetChatMessage) {
        // New chat message. Notify user and present chat.
        
        if (!InfosetChat.isChatPresented) {
            // Notifying user
            let alert = UIAlertController(title: "New message", message: message.message, preferredStyle: .alert)
            let chatAction = UIAlertAction(title: "Open chat", style: .default) { alert in
                // Presenting chat if not presented
                if !InfosetChat.isChatPresented {
                    InfosetChat.presentChat()
                }
            }
            alert.addAction(chatAction)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
            alert.addAction(cancelAction)
            
            window?.rootViewController?.present(alert, animated: true, completion: nil)
        }
    }
    
    func handle(URL: URL) {
        UIApplication.shared.openURL(URL)
    }
}

