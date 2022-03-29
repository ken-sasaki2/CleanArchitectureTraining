//
//  RootViewController.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/03/29.
//

import Foundation

final class RootViewController {
    private let rootViewUseCase: RootViewUseCaseInterface
    
    init(rootViewUseCase: RootViewUseCaseInterface) {
        self.rootViewUseCase = rootViewUseCase
    }
    
    func successSignUp() {
        rootViewUseCase.successSignUp()
    }
    
    func successSignIn() {
        rootViewUseCase.successSignIn()
    }
}
