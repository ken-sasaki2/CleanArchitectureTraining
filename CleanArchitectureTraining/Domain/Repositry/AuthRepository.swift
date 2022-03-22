//
//  AuthRepository.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/03/22.
//

import Foundation

protocol AuthRepositoryInterface {
    func createUser(authModel: AuthCreateUserModel) async -> AuthResponseTypeEntity
}

final class AuthRepository: AuthRepositoryInterface {
    private let authDataStore: AuthDataStoreInterface
    
    init(authDataStore: AuthDataStoreInterface) {
        self.authDataStore = authDataStore
    }
    
    func createUser(authModel: AuthCreateUserModel) async -> AuthResponseTypeEntity {
        let response = await authDataStore.createUser(authModel: authModel)
        return response
    }
}
