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
            try await userRepository.saveUser(inputData: inputData)
            print("send presenter.")
        } catch  {
            print("error!")
        }
    }
}
