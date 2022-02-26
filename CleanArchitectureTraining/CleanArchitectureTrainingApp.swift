//
//  CleanArchitectureTrainingApp.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/02/26.
//

import SwiftUI
import Firebase

@main
struct CleanArchitectureTrainingApp: App {
    @UIApplicationDelegateAdaptor (AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

final class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        firebaseConfigure()
        return true
    }
     
    private func firebaseConfigure() {
        #if DEBUG
        let filePath = Bundle.main.path(forResource: "GoogleService-Info-Debug", ofType: "plist")
        #else
        let filePath = Bundle.main.path(forResource: "GoogleService-Info-Release", ofType: "plist")
        #endif
        
        guard let filePath = filePath else {
            return
        }
        guard let options = FirebaseOptions(contentsOfFile: filePath) else {
                return
        }
        
        print("filePath:", filePath)
        print("options:", options)

        FirebaseApp.configure(options: options)
    }
}
