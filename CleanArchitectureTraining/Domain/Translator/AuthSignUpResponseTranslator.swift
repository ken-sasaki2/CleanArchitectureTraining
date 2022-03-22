//
//  AuthSignUpResponseTranslator.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/03/22.
//

import Foundation

final class AuthSignUpResponseTranslator {
    static let shared = AuthSignUpResponseTranslator()
    
    private init() {}
    
    func translate(responseTypeEntity: AuthResponseTypeEntity) -> AuthResponseType {
        switch responseTypeEntity {
        case .success:
            return .success
        case .invalidEmail:
            return .invalidEmail
        case .weakPassword:
            return .weakPassword
        case .emailAlreadyInUse:
            return .emailAlreadyInUse
        case .networkError:
            return .networkError
        case .otherError:
            return .otherError
        }
    }
}
