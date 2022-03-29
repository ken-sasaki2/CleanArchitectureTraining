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
}
