//
//  UserDeleteUseCase.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/03/17.
//

import Foundation

protocol UserDeleteUseCaseInterface {
    func deleteUser() async throws
}

final class UserDeleteUseCase: UserDeleteUseCaseInterface {
    private let userRepository: UserRepositoryInterface
    private let userDeletePresenter: UserDeletePresenterInterface
    
    init(userRepository: UserRepositoryInterface, userDeletePresenter: UserDeletePresenterInterface) {
        self.userRepository = userRepository
        self.userDeletePresenter = userDeletePresenter
    }
    
    func deleteUser() async throws {
        do {
            try await userRepository.deleteUser()
            userRepository.setIsUserDataSaved(isSaved: false)
            userDeletePresenter.successDeleteUser()
        } catch {
            userDeletePresenter.failDeleteUser()
        }
    }
}
