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
        let signOutVM = AuthSignOutViewModel()
        
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
                        authSignInVM: signInVM
                    )
                ),
                authSignOutUseCase: AuthSignOutUseCase(
                    authRepository: AuthRepository(
                        authDataStore: AuthDataStore()
                    ),
                    authSignOutPresenter: AuthSignOutPresenter(
                        authSignOutVM: signOutVM
                    )
                ),
                authUserFetchUseCase: AuthUserFetchUseCase(
                    authRepository: AuthRepository(
                        authDataStore: AuthDataStore()
                    ),
                    authUserFetchPresenter: AuthUserFetchPresenter(
                        authUserFetchVM: AuthUserFetchViewModel()
                    )
                )
            ),
            rootViewController: RootViewController(
                rootViewUseCase: RootViewUseCase(
                    rootViewPresenter: RootViewPresenter()
                )
            )
        )
        return view
    }
}
