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
            let isValidUserName = isValidUserName(name: inputData.name)
            let isValidGender = isValidGender(gender: inputData.gender)
            
            if !isValidUserName {
                userPresenter.invalidUserName()
                return
            }
            
            if !isValidGender {
                userPresenter.invalidGender()
                return
            }
            
            // presenterへ保存成功を通知
            try await userRepository.saveUser(inputData: inputData)
        } catch {
            // presenterへ保存失敗を通知
        }
    }
    
    func isValidUserName(name: String) -> Bool {
        let isMin = name.count >= 2
        let isMax = name.count <= 10
        
        if isMin && isMax {
            return true
        } else {
            return false
        }
    }
    
    func isValidGender(gender: Int) -> Bool {
        switch gender {
        case 1:
            return true
        case 2:
            return true
        case 3:
            return true
        default:
            return false
        }
    }
}
