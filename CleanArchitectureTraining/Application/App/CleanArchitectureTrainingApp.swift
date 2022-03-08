//
//  CleanArchitectureTrainingApp.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/02/26.
//

import SwiftUI

@main
struct CleanArchitectureTrainingApp: App {
    @UIApplicationDelegateAdaptor (AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            UserProfileBuilder.shared.build()
        }
    }
}
