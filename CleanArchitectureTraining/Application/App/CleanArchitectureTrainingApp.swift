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
    @StateObject private var rootViewModel = RootViewMode.shared
    
    var body: some Scene {
        WindowGroup {
            switch rootViewModel.rootView {
            case .signIn:
                AuthSignInBuilder.shared.build()
            case .signUp:
                AuthSignUpBuilder.shared.build()
            case .profile:
                UserProfileBuilder.shared.build()
            }
        }
    }
}
