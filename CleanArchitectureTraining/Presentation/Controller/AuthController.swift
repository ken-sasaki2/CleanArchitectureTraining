//
//  AuthController.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/03/22.
//

import Foundation

final class AuthController {
    private let authSignUpUseCase: AuthSignUpUseCase
    
    init(authSignUpUseCase: AuthSignUpUseCase) {
        self.authSignUpUseCase = authSignUpUseCase
    }
    
    func signUp(email: String, password: String) {
        let model = AuthRequestModel(email: email, password: password)
        Task {
            await authSignUpUseCase.signUp(requestModel: model)
        }
    }
}
