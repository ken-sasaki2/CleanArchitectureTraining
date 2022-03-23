//
//  AuthRepository.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/03/22.
//

import Foundation

protocol AuthRepositoryInterface {
    func signUp(requestModel: AuthRequestModel) async -> AuthResponseTypeEntity
}

final class AuthRepository: AuthRepositoryInterface {
    private let authDataStore: AuthDataStoreInterface
    
    init(authDataStore: AuthDataStoreInterface) {
        self.authDataStore = authDataStore
    }
    
    func signUp(requestModel: AuthRequestModel) async -> AuthResponseTypeEntity {
        let response = await authDataStore.signUp(requestModel: requestModel)
        return response
    }
}
