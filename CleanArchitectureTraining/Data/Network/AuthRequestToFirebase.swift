//
//  AuthRequestToFirebase.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/03/20.
//

import FirebaseAuth

final class AuthRequestToFirebase {
    
    func createUser(authEntity: AuthCreateUserEntity) async throws {
        return try await withCheckedThrowingContinuation { continuation in
            Auth.auth().createUser(withEmail: authEntity.email, password: authEntity.password) { authResult, error in
                if let error = error {
                    let errorCode = AuthErrorCode(rawValue: error._code)
                    switch errorCode {
                    case .invalidEmail:
                        print("Error to email address format.")
                        continuation.resume(throwing: error)
                    case .weakPassword:
                        print("Error weak password.")
                        continuation.resume(throwing: error)
                    case .emailAlreadyInUse:
                        print("Error email already in use.")
                        continuation.resume(throwing: error)
                    case .networkError:
                        print("Network error.")
                        continuation.resume(throwing: error)
                    default:
                        print("Other error.")
                        continuation.resume(throwing: error)
                    }
                }
                
                continuation.resume(returning: ())
            }
        }
    }
}
