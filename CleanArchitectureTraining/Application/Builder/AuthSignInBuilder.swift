//
//  AuthSignInBuilder.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/03/23.
//

import Foundation

final class AuthSignInBuilder {
    static let shared = AuthSignInBuilder()
    
    private init() {}
    
    func build() -> AuthSignInView {
        let signUpVM = AuthSignUpViewModel()
        let signInVM = AuthSignInViewModel()
        let view = AuthSignInView(
            authSignInVM: signInVM,
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
                        authSignInVM: signInVM
                    )
                )
            )
        )
        return view
    }
}
