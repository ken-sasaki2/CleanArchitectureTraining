//
//  AuthSignUpBuilder.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/03/22.
//

import Foundation

final class AuthSignUpBuilder {
    static let shared = AuthSignUpBuilder()
    
    private init() {}
    
    func build() -> AuthSignUpView {
        let signUpVM = AuthSignUpViewModel()
        let signInVM = AuthSignInViewModel()
        let view = AuthSignUpView(
            authSignUpVM: signUpVM,
            authController: AuthController(
                authSignUpUseCase: AuthSignUpUseCase(
                    authRepository: AuthRepository(
                        authDataStore: AuthDataStore()
                    ),
                    authSignUpPresenter: AuthSignUpPresenter(
                        authSignUpVM: signUpVM
                    )
                ),
                authSignInUseCase: AuthSignInUseCase(
                    authRepository: AuthRepository(
                        authDataStore: AuthDataStore()
                    ),
                    authSignInPresenter: AuthSignInPresenter(
                        authSignInVM: signInVM)
                )
            )
        )
        return view
    }
}
