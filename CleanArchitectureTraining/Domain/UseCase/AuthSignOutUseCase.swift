//
//  AuthSignOutUseCase.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/04/06.
//

import Foundation

protocol AuthSignOutUseCaseInterface {
    func signOut() async throws
}

final class AuthSignOutUseCase: AuthSignOutUseCaseInterface {
    private let authRepository: AuthRepositoryInterface
    private let authSignOutPresenter: AuthSignOutPresenterInterface
    
    init(authRepository: AuthRepositoryInterface, authSignOutPresenter: AuthSignOutPresenterInterface) {
        self.authRepository = authRepository
        self.authSignOutPresenter = authSignOutPresenter
    }
    
    func signOut() async throws {
        do {
            try await authRepository.signOut()
            authSignOutPresenter.successSignOut()
        } catch {
            authSignOutPresenter.failSignOut()
        }
    }
}
