//
//  AuthDataStore.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/03/20.
//

import Foundation

protocol AuthDataStoreInterface {
    func createUser(authModel: AuthCreateUserModel) async -> AuthResponseTypeEntity
}

final class AuthDataStore: AuthDataStoreInterface {
    private let authRequest = AuthRequestToFirebase()
    
    func createUser(authModel: AuthCreateUserModel) async -> AuthResponseTypeEntity {
        let entity = AuthCreateUserEntity(email: authModel.email, password: authModel.password)
        let response = await authRequest.createUser(authEntity: entity)
        return response
    }
}
