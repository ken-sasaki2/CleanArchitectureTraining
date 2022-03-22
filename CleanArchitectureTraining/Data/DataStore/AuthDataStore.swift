//
//  AuthDataStore.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/03/20.
//

import Foundation

protocol AuthDataStoreInterface {
    func signUp(signUpModel: AuthSignUpModel) async -> AuthResponseTypeEntity
}

final class AuthDataStore: AuthDataStoreInterface {
    private let authRequest = AuthRequestToFirebase()
    
    func signUp(signUpModel: AuthSignUpModel) async -> AuthResponseTypeEntity {
        let entity = AuthSignUpEntity(email: signUpModel.email, password: signUpModel.password)
        let response = await authRequest.signUp(signUpEntity: entity)
        return response
    }
}
