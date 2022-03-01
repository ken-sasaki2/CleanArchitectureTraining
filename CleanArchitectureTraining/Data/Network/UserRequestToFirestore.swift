//
//  UserRequestToFirestore.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/02/26.
//

import Firebase

final class UserRequestToFirestore {
    private let db = Firestore.firestore()
    
    func saveUser(inputData: UserAddInputData) {
        // 保存処理
        print("inputData:", inputData)
    }
    
    
    func fetchUser() {
        
    }
    
    
    func deleteUser() {
        
    }
}
