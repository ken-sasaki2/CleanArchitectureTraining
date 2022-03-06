//
//  UserAddUseCase.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/02/26.
//

import Foundation

protocol UserAddUseCaseInterface {
    func saveUser(inputData: UserAddInputData) async throws -> Void
}

final class UserAddUseCase: UserAddUseCaseInterface {
    private let userRepository: UserRepositoryInterface
    private let userPresenter: UserPresenterInterface
    
    init(userRepository: UserRepositoryInterface, userPresenter: UserPresenterInterface) {
        self.userRepository = userRepository
        self.userPresenter = userPresenter
    }
    
    convenience init() {
        self.init(
            userRepository: RepositoryLocator.shared.getUserRepository(),
            userPresenter: RepositoryLocator.shared.getUserPresenter()
        )
    }
    
    func saveUser(inputData: UserAddInputData) async throws -> Void {
        do {
            if isValidateUserName(inputData: inputData) {
                userPresenter.isValidateFailure(result: true)
                return
            }
            try await userRepository.saveUser(inputData: inputData)
            // presenterへ保存成功を通知
        } catch {
            // presenterへ保存失敗を通知
        }
    }
    
    func isValidateUserName(inputData: UserAddInputData) -> Bool {
        let isMin = inputData.name.count >= 2
        let isMax = inputData.name.count <= 10
        
        if isMin && isMax {
            return true
        } else {
            return false
        }
    }
}
