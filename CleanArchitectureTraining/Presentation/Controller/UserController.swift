//
//  UserController.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/02/26.
//

import Foundation

final class UserController {
    private let userAddUseCase: UserAddUseCaseInterface
    
    init(userAddUseCase: UserAddUseCaseInterface) {
        self.userAddUseCase = userAddUseCase
    }
    
    convenience init() {
        self.init(userAddUseCase: RepositoryLocator.shared.getUserAddUseCase())
    }
    
    func createUser(name: String, gender: Int) {
        let inputData = UserAddInputData(name: name, gender: gender, createdAt: Date().timeIntervalSince1970)
        Task {
            try await userAddUseCase.saveUser(inputData: inputData)
        }
    }
}
