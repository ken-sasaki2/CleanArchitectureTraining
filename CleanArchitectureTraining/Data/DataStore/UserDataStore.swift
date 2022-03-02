//
//  UserDataStore.swift
//  CleanArchitectureTraining
//
//  Created by sasaki.ken on 2022/02/26.
//

import Foundation

protocol UserDataStoreInterface {
    func saveUser(inputData: UserAddInputData) async throws -> Void 
    func fetchUser()
    func deleteUser()
}

final class UserDataStore: UserDataStoreInterface {
    private let userRequest = UserRequestToFirestore()
    
    func saveUser(inputData: UserAddInputData) async throws -> Void {
        do {
            try await userRequest.saveUser(inputData: inputData)
            return ()
        } catch {
            throw error
        }
    }
    
    func fetchUser() {
        
    }
    
    func deleteUser() {
        
    }
}
