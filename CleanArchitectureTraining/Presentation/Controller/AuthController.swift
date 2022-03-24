//
//  AuthController.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/03/22.
//

import Foundation

final class AuthController {
    private let authSignUpUseCase: AuthSignUpUseCase
    private let authSignInUseCase: AuthSignInUseCase
    
    init(authSignUpUseCase: AuthSignUpUseCase, authSignInUseCase: AuthSignInUseCase) {
        self.authSignUpUseCase = authSignUpUseCase
        self.authSignInUseCase = authSignInUseCase
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
}
