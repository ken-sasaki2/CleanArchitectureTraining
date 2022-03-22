//
//  AuthDataStore.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/03/20.
//

import Foundation

protocol AuthDataStoreInterface {
    func createUser(authEntity: AuthCreateUserEntity) async -> AuthResponseTypeEntity
}

final class AuthDataStore: AuthDataStoreInterface {
    private let authRequest = AuthRequestToFirebase()
    
    func createUser(authEntity: AuthCreateUserEntity) async -> AuthResponseTypeEntity {
        let response = await authRequest.createUser(authEntity: authEntity)
        return response
    }
}
