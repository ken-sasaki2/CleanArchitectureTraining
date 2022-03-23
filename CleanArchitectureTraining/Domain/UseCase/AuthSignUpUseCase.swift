//
//  AuthSignUpUseCase.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/03/22.
//

import Foundation

protocol AuthSignUpUseCaseInterface {
    func signUp(requestModel: AuthRequestModel) async
}

final class AuthSignUpUseCase: AuthSignUpUseCaseInterface {
    private let authRepository: AuthRepositoryInterface
    private let authSignUpPresenter: AuthSignUpPresenterInterface
    
    init(authRepository: AuthRepositoryInterface, authSignUpPresenter: AuthSignUpPresenterInterface) {
        self.authRepository = authRepository
        self.authSignUpPresenter = authSignUpPresenter
    }
    
    func signUp(requestModel: AuthRequestModel) async {
        let response = await authRepository.signUp(requestModel: requestModel)
        let responseType = AuthSignUpResponseTranslator.shared.translate(responseTypeEntity: response)
        
        switch responseType {
        case .success:
            authSignUpPresenter.successSignUp()
        case .invalidEmail:
            authSignUpPresenter.failInvalidEmail()
        case .weakPassword:
            authSignUpPresenter.failWeakPassword()
        case .emailAlreadyInUse:
            authSignUpPresenter.failEmailAlreadyInUse()
        case .networkError:
            authSignUpPresenter.failNetworkError()
        case .otherError:
            authSignUpPresenter.failOtherError()
        }
    }
}
