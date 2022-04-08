//
//  RootViewUseCase.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/03/29.
//

import Foundation

protocol RootViewUseCaseInterface {
    func successSignUp()
    func successSignIn()
    func successSignOut()
    func alreadySignedUpUser()
    func notSignedUpUser()
}

final class RootViewUseCase: RootViewUseCaseInterface {
    private let rootViewPresenter: RootViewPresenterInterface
    
    init(rootViewPresenter: RootViewPresenterInterface) {
        self.rootViewPresenter = rootViewPresenter
    }
    
    func successSignUp() {
        rootViewPresenter.changeProfileView()
    }
    
    func successSignIn() {
        rootViewPresenter.changeProfileView()
    }
    
    func successSignOut() {
        rootViewPresenter.changeSignInView()
    }
    
    func alreadySignedUpUser() {
        rootViewPresenter.alreadySignedUpUser()
    }
    
    func notSignedUpUser() {
        rootViewPresenter.notSignedUpUser()
    }
}
