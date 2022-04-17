//
//  AuthUserFetchUseCase.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/04/08.
//

import Foundation

protocol AuthUserFetchUseCaseInterface {
    func fetchAuthCurrentUser() async
}

final class AuthUserFetchUseCase: AuthUserFetchUseCaseInterface {
    private let authRepository: AuthRepositoryInterface
    private let authUserFetchPresenter: AuthUserFetchPresenterInterface
    
    init(authRepository: AuthRepositoryInterface, authUserFetchPresenter: AuthUserFetchPresenterInterface) {
        self.authRepository = authRepository
        self.authUserFetchPresenter = authUserFetchPresenter
    }
    
    func fetchAuthCurrentUser() async {
        let entity = await authRepository.fetchAuthCurrentUser()
        guard let entity = entity else {
            authUserFetchPresenter.failFetchedUser()
            return
        }

        let model = AuthUserModelTranslator.shared.translate(entity: entity)
        authUserFetchPresenter.successFetchedUser(model: model)
    }
}
