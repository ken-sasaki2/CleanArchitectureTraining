//
//  UserRepository.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/02/26.
//

import Foundation

protocol UserRepositoryInterface {
    func saveUser(inputData: UserAddInputData)
}

final class UserRepository: UserRepositoryInterface {
    private let userDataStore: UserDataStoreInterface
    
    init(userDataStore: UserDataStoreInterface) {
        self.userDataStore = userDataStore
    }
    
    convenience init() {
        self.init(userDataStore: RepositoryLocator.shared.getUserDataStoreImpl())
    }
    
    func saveUser(inputData: UserAddInputData) {
        userDataStore.saveUser(inputData: inputData)
    }
}
