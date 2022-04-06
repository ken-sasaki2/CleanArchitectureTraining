//
//  AuthSignInUseCase.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/03/23.
//

import Foundation

protocol AuthSignInUseCaseInterface {
    func signIn(requestModel: AuthRequestModel) async
}

final class AuthSignInUseCase: AuthSignInUseCaseInterface {
    private let authRepository: AuthRepositoryInterface
    private let authSignInPresenter: AuthSignInPresenterInterface
    
    init(authRepository: AuthRepositoryInterface, authSignInPresenter: AuthSignInPresenterInterface) {
        self.authRepository = authRepository
        self.authSignInPresenter = authSignInPresenter
    }
    
    func signIn(requestModel: AuthRequestModel) async {
        let response = await authRepository.signIn(requestModel: requestModel)
        let responceType = AuthResponseTypeTranslator.shared.translate(responseTypeEntity: response)
        
        switch responceType {
        case .success:
            authSignInPresenter.successSignIn()
        case .invalidEmail:
            authSignInPresenter.failInvalidEmail()
        case .weakPassword:
            authSignInPresenter.failWeakPassword()
        case .emailAlreadyInUse:
            authSignInPresenter.failEmailAlreadyInUse()
        case .networkError:
            authSignInPresenter.failNetworkError()
        case .otherError:
            authSignInPresenter.failOtherError()
        }
    }
}
