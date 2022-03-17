//
//  UserRequestToFirestore.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/02/26.
//

import Firebase
import FirebaseAuth

final class UserRequestToFirestore {
    private let reference = Firestore.firestore().collection("users").document("123").collection("user")
    
    func saveUser(inputEntity: UserAddInputEntity) async throws -> Void {
        return try await withCheckedThrowingContinuation { continuation in
            reference.addDocument(data: [
                "name" : inputEntity.name,
                "gender" : inputEntity.gender,
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
    
    func fetchUser() async throws -> UserFetchOutputEntity {
        return try await withCheckedThrowingContinuation({ continuation in
            reference.getDocuments { snapShot, error in
                if let error = error {
                    print("Error getting documents:", error)
                    continuation.resume(throwing: error)
                }
                
                if let snapshotDocuments = snapShot?.documents {
                    snapshotDocuments.forEach { document in
                        let data = document.data()
                        if let name = data["name"] as? String,
                           let gender = data["gender"] as? Int,
                           let createdAt = data["createdAt"] as? Double,
                           let documentId = document.documentID as String? {
                            
                            let entity = UserFetchOutputEntity(
                                name: name,
                                gender: gender,
                                createdAt: createdAt,
                                documentId: documentId
                            )
                            
                            continuation.resume(returning: entity)
                        } else {
                            let error = NSError(domain: "Required document data not found.", code: -1)
                            continuation.resume(throwing: error)
                        }
                    }
                }
            }
        })
    }
    
    
    func deleteUser(documentId: String) async throws -> Void {
        return try await withCheckedThrowingContinuation({ continuation in
            reference.document(documentId).delete() { error in
                if let error = error {
                    print("Error removing document:", error)
                    continuation.resume(throwing: error)
                } else {
                    print("Success remove document.")
                    continuation.resume(returning: ())
                }
            }
        })
    }
}
