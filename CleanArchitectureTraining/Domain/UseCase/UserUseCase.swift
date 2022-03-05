//
//  UserUseCase.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/02/26.
//

import Foundation

protocol UserUseCaseInterface {
    func saveUser(inputData: UserAddInputData) async throws -> Void
}

final class UserUseCase: UserUseCaseInterface {
    private let userRepository: UserRepositoryInterface
    
    init(userRepository: UserRepositoryInterface) {
        self.userRepository = userRepository
    }
    
    convenience init() {
        self.init(userRepository: RepositoryLocator.shared.getUserRepository())
    }
    
    func saveUser(inputData: UserAddInputData) async throws -> Void {
        do {
            if !isValidateUserName(inputData: inputData) {
                // presenterへvalidate失敗を通知
                return
            }
            try await userRepository.saveUser(inputData: inputData)
            // presenterへ保存成功を通知
        } catch {
            // presenterへ保存失敗を通知
        }
    }
    
    private func isValidateUserName(inputData: UserAddInputData) -> Bool {
        let isMin = inputData.name.count >= 2
        let isMax = inputData.name.count <= 10
        
        if isMin && isMax {
            return true
        } else {
            return false
        }
    }
}
