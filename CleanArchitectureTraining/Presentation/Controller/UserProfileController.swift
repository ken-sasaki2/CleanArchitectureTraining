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
    private let userDeleteUseCase: UserDeleteUseCaseInterface
    
    init(userAddUseCase: UserAddUseCaseInterface, userFetchUseCase: UserFetchUseCase, userDeleteUseCase: UserDeleteUseCaseInterface) {
        self.userAddUseCase = userAddUseCase
        self.userFetchUseCase = userFetchUseCase
        self.userDeleteUseCase = userDeleteUseCase
    }
    
    func createUser(uid: String, name: String, gender: Int) {
        let inputData = UserAddInputData(
            name: name,
            gender: gender,
            createdAt: Date().timeIntervalSince1970
        )
        
        Task {
            try await userAddUseCase.saveUser(inputData: inputData)
        }
    }
    
    func fetchUser() {
        Task {
            try await userFetchUseCase.fetchUser()
        }
    }
    
    func deleteUser() {
        Task {
            try await userDeleteUseCase.deleteUser()
        }
    }
    
    func getIsUserDataSaved() {
        userFetchUseCase.getIsUserDataSaved()
    }
}
