//
//  AuthRequestToFirebase.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/03/20.
//

import FirebaseAuth

final class AuthRequestToFirebase {
    
    func createUser(authEntity: AuthCreateUserEntity) async -> AuthResponseTypeEntity {
        return await withCheckedContinuation { continuation in
            Auth.auth().createUser(withEmail: authEntity.email, password: authEntity.password) { authResult, error in
                if let error = error {
                    let errorCode = AuthErrorCode(rawValue: error._code)
                    switch errorCode {
                    case .invalidEmail:
                        continuation.resume(returning: .invalidEmail)
                    case .weakPassword:
                        continuation.resume(returning: .weakPassword)
                    case .emailAlreadyInUse:
                        continuation.resume(returning: .emailAlreadyInUse)
                    case .networkError:
                        continuation.resume(returning: .networkError)
                    default:
                        continuation.resume(returning: .otherError)
                    }
                } else {
                    continuation.resume(returning: .success)
                }
            }
        }
    }
}
