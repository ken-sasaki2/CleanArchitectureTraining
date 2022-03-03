//
//  UserRequestToFirestore.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/02/26.
//

import Firebase

final class UserRequestToFirestore {
    private let db = Firestore.firestore()
    
    func saveUser(inputEntity: UserAddInputEntity) async throws -> Void {
        return try await withCheckedThrowingContinuation { continuation in
            db.collection("user").document().setData([
                "name" : inputEntity.name,
                "gender" : inputEntity.gender,
                "birthday" : inputEntity.birthday,
                "createdAt" : inputEntity.createdAt
            ]) { error in
                if let error = error {
                    print("Error writing document:", error)
                    continuation.resume(throwing: error)
                } else {
                    print("Success write document.")
                    continuation.resume(returning: ())
                }
            }
        }
    }
    
    
    func fetchUser() {
        
    }
    
    
    func deleteUser() {
        
    }
}
