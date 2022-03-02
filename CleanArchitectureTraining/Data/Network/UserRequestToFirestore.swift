//
//  UserRequestToFirestore.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/02/26.
//

import Firebase

final class UserRequestToFirestore {
    private let db = Firestore.firestore()
    
    func saveUser(inputData: UserAddInputData) async throws -> Void {
        return try await withCheckedThrowingContinuation { continuation in
            db.collection("user").document().setData([
                "name" : inputData.name,
                "gender" : inputData.gender,
                "birthday" : inputData.birthday,
                "createdAt" : Date().timeIntervalSince1970
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
