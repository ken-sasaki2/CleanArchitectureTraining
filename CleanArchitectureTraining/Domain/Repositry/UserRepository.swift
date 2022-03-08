//
//  UserRepository.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/02/26.
//

import Foundation

protocol UserRepositoryInterface {
    func saveUser(inputData: UserAddInputData) async throws -> Void
}

final class UserRepository: UserRepositoryInterface {
    private let userDataStore: UserDataStoreInterface
    
    init(userDataStore: UserDataStoreInterface) {
        self.userDataStore = userDataStore
    }
    
    convenience init() {
        self.init(userDataStore: UserDataStore())
    }
    
    func saveUser(inputData: UserAddInputData) async throws -> Void {
        do {
            try await userDataStore.saveUser(inputData: inputData)
            return
        } catch {
            throw error
        }
    }
}
