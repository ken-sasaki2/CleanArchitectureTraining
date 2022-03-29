//
//  RootViewMode.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/03/29.
//

import Foundation

final class RootViewMode: ObservableObject {
    @Published private(set) var rootView: RootViews = .signUp
    static let shared = RootViewMode()
    
    enum RootViews {
        case signIn
        case signUp
        case profile
    }
    
    func changeRootView(rootView: RootViews) {
        self.rootView = rootView
    }
}
