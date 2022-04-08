//
//  AuthController.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/03/22.
//

import Foundation

final class AuthController {
    private let authSignUpUseCase: AuthSignUpUseCaseInterface
    private let authSignInUseCase: AuthSignInUseCaseInterface
    private let authSignOutuseCase: AuthSignOutUseCaseInterface
    
    init(
        authSignUpUseCase: AuthSignUpUseCaseInterface,
        authSignInUseCase: AuthSignInUseCaseInterface,
        authSignOutUseCase: AuthSignOutUseCaseInterface
    ) {
        self.authSignUpUseCase = authSignUpUseCase
        self.authSignInUseCase = authSignInUseCase
        self.authSignOutuseCase = authSignOutUseCase
    }
    
    func signUp(email: String, password: String) {
        let model = AuthRequestModel(email: email, password: password)
        Task {
            await authSignUpUseCase.signUp(requestModel: model)
        }
    }
    
    func signIn(email: String, password: String) {
        let model = AuthRequestModel(email: email, password: password)
        Task {
            await authSignInUseCase.signIn(requestModel: model)
        }
    }
    
    func signOut() {
        Task {
            try await authSignOutuseCase.signOut()
        }
    }
}
