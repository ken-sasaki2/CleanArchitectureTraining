//
//  RootViewPresenter.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/03/29.
//

import Foundation
 
protocol RootViewPresenterInterface {
    func changeProfileView()
    func changeSignInView()
}

final class RootViewPresenter: RootViewPresenterInterface {
    
    func changeProfileView() {
        RootViewModel.shared.changeRootView(rootView: .profile)
    }
    
    func changeSignInView() {
        RootViewModel.shared.changeRootView(rootView: .signIn)
    }
}
