//
//  UserController.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/02/26.
//

import Foundation

final class UserController {
    private let userUseCase: UserUseCaseInterface
    
    init(userUseCase: UserUseCaseInterface) {
        self.userUseCase = userUseCase
    }
    
    convenience init() {
        self.init(userUseCase: RepositoryLocator.shared.getUserUseCase())
    }
    
    func createUser(name: String, gender: Int, birthday: String) {
        let inputData = UserAddInputData(name: name, gender: gender, birthday: birthday, createdAt: Date().timeIntervalSince1970)
        Task {
            try await userUseCase.saveUser(inputData: inputData)
        }
    }
}
