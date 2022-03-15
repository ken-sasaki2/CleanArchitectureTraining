//
//  UserProfileController.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/02/26.
//

import Foundation

final class UserProfileController {
    private let userAddUseCase: UserAddUseCaseInterface
    private let userFetchUseCase: UserFetchUseCase
    
    init(userAddUseCase: UserAddUseCaseInterface, userFetchUseCase: UserFetchUseCase) {
        self.userAddUseCase = userAddUseCase
        self.userFetchUseCase = userFetchUseCase
    }
    
    func createUser(name: String, gender: Int) {
        let inputData = UserAddInputData(name: name, gender: gender, createdAt: Date().timeIntervalSince1970)
        Task {
            try await userAddUseCase.saveUser(inputData: inputData)
        }
    }
    
    func fetchUser() {
        Task {
            try await userFetchUseCase.fetchUser()
        }
    }
}
