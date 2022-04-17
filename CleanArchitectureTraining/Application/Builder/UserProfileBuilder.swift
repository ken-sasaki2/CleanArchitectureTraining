//
//  UserProfileBuilder.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/03/08.
//

import Foundation

final class UserProfileBuilder {
    static let shared = UserProfileBuilder()
    
    private init() {}
    
    func build() -> UserProfileView {
        let userProfileVM = UserProfileViewModel()
        let signUpVM = AuthSignUpViewModel()
        let signInVM = AuthSignInViewModel()
        let signOutVM = AuthSignOutViewModel()
        let authUserFetchVM = AuthUserFetchViewModel()
        
        let view = UserProfileView(
            userProfileVM: userProfileVM,
            authSignOutVM: signOutVM,
            authUserFetchVM: authUserFetchVM,
            userProfileController: UserProfileController(
                userAddUseCase: UserAddUseCase(
                    userRepository: UserRepository(
                        userDataStore: UserDataStore()
                    ),
                    userAddPresenter: UserAddPresenter(
                        userProfileVM: userProfileVM
                    )
                ),
                userFetchUseCase: UserFetchUseCase(
                    userRepository: UserRepository(
                        userDataStore: UserDataStore()
                    ),
                    userFetchPresenter: UserFetchPresenter(
                        userProfileVM: userProfileVM
                    )
                ),
                userDeleteUseCase: UserDeleteUseCase(
                    userRepository: UserRepository(
                        userDataStore: UserDataStore()
                    ),
                    userDeletePresenter: UserDeletePresenter(
                        userProfileVM: userProfileVM
                    )
                )
            ),
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
                        authUserFetchVM: authUserFetchVM
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
