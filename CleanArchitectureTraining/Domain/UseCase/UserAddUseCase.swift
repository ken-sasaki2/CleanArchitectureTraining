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
    private let userAddPresenter: UserAddPresenterInterface
    
    init(userRepository: UserRepositoryInterface, userAddPresenter: UserAddPresenterInterface) {
        self.userRepository = userRepository
        self.userAddPresenter = userAddPresenter
    }
    
    func saveUser(inputData: UserAddInputData) async throws -> Void {
        do {
            let isValidUserName = isValidUserName(name: inputData.name)
            let isValidGender = isValidGender(gender: inputData.gender)
            
            if !isValidUserName {
                userAddPresenter.invalidUserName()
                return
            }
            
            if !isValidGender {
                userAddPresenter.invalidGender()
                return
            }
            
            try await userRepository.saveUser(inputData: inputData)
            userRepository.setIsUserDataSaved(isSaved: true)
            userAddPresenter.successSaveUser()
        } catch {
            userAddPresenter.failSaveUser()
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
